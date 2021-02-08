Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8C7B3142D5
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 23:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhBHWY4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 17:24:56 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:33945 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbhBHWYy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 17:24:54 -0500
Received: from orion.localdomain ([95.115.15.83]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M8QFi-1lDcdN1Uhs-004WHh; Mon, 08 Feb 2021 23:22:17 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        frowand.list@gmail.com, pantelis.antoniou@konsulko.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 10/12] export bus_get() / bus_put()
Date:   Mon,  8 Feb 2021 23:22:01 +0100
Message-Id: <20210208222203.22335-11-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210208222203.22335-1-info@metux.net>
References: <20210208222203.22335-1-info@metux.net>
X-Provags-ID: V03:K1:kDRmEzIQ/F5sQbE196NAs1VlxNWRXpNXbH/MXduf2nSFEhfshKh
 Pho+/pjgZO0/8botPezg8A8IsqGKMi4GXn5N7nGB5CjPbdQUuG+mNHjXaZs4/KUm6Tg0ACu
 d1hAzte3az5tvT8GsFsfwWicGAftGJo45kCNRkBjy1G2hE5omPD8bD9Rau5wP6IOhm+I0Jr
 IShaMZT+84jKYiXPQa00g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pxUWDFfYvE4=:glNHz9gYCeZb+E7U3fAb5c
 xJ0nCG21DGUYAjCD2bD0dAOOk4zbmeCuHKpmGHsEUpa6fNeTF2tqf1RETA5TR+ybt0GSpN9Dt
 7Xy3fcXl4u/HX02GUU6ZcytLsqs0Htc5/Vc0vchfsxaQPUGPN36UBmXNO4Q20paDFxhSf33tF
 CzKe03kY2wfMyU6ElkDVybFUBkWjlpL7Kraz1Lh4GY0amWO6n2VoOLKNziuG3Tv/e8VDdwRLI
 wJ8vIKpqu/Mkig89QwWt2nRqSeyDcrMqWvcU2YxK6D0mqyWm4hc+bIpGEySwpiv3IZbBd3Vd0
 Lrdh6F4mXODb8DDDNYM6A+xecFnCRfMFpAHcjE9FYjrW4XG0EPNF4KNfimUCTfcr73rNIgY2w
 XbW7WcHYv3sk0+W7JyHf82Q4Rt0iuG4dFRL7LP8H6f4CpImdWY8dDH6HwflUA
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

---
 drivers/base/bus.c         | 6 ++++--
 include/linux/device/bus.h | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index a06ae2786092..2ef92a3c5d7b 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -39,7 +39,7 @@ static struct kset *system_kset;
 static int __must_check bus_rescan_devices_helper(struct device *dev,
 						void *data);
 
-static struct bus_type *bus_get(struct bus_type *bus)
+struct bus_type *bus_get(struct bus_type *bus)
 {
 	if (bus) {
 		kset_get(&bus->p->subsys);
@@ -47,12 +47,14 @@ static struct bus_type *bus_get(struct bus_type *bus)
 	}
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(bus_get);
 
-static void bus_put(struct bus_type *bus)
+void bus_put(struct bus_type *bus)
 {
 	if (bus)
 		kset_put(&bus->p->subsys);
 }
+EXPORT_SYMBOL_GPL(bus_put);
 
 static ssize_t drv_attr_show(struct kobject *kobj, struct attribute *attr,
 			     char *buf)
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index b4cbcfe176c5..8d6b45df0a82 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -120,6 +120,9 @@ extern void bus_unregister(struct bus_type *bus);
 
 extern int __must_check bus_rescan_devices(struct bus_type *bus);
 
+struct bus_type *bus_get(struct bus_type *bus);
+void bus_put(struct bus_type *bus);
+
 struct bus_attribute {
 	struct attribute	attr;
 	ssize_t (*show)(struct bus_type *bus, char *buf);
-- 
2.11.0

