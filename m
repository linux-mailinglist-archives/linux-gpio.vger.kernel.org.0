Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFB756BC4E
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 14:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbfGQM20 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jul 2019 08:28:26 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53872 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbfGQM20 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jul 2019 08:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=LzmNjpjSX9Wly7eBTDbvTM1R7YMU15H5jVWtYA+bPfE=; b=fOHEYAxD9z/EgMFZC3GsI3DwDY
        gvja0hNb0PxqtktaET7MwLS6ZYH1Z6zWfH9fTePFsmZKaK65pbu4T7A9k2Xnnk0aYMDm2CAeOaQFc
        6utUa39CikS1VVask82AIqamnwlwC4Jbr6Y7mNekAC92egoObjqj0dAJAWCnOihJm/4tclTvUwdmU
        Ld7K1/cLkqD2+kdOQCeNYOshlnTxF8FpGv5EGp0fycIvrfhDlJ3CwJDfu3bya9rNcJfmiF9/ebSov
        d9sI6SGuGp7tW1c3v4ytH3zMdtwsy9MURSAhrvauF4fg68n1t0b07k15u+Y4Ge9vBXhzdII/+gceB
        2wTbNHgA==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnj2m-0006fe-U1; Wed, 17 Jul 2019 12:28:24 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnj2k-00052m-5y; Wed, 17 Jul 2019 09:28:22 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v4 14/15] docs: ABI: obsolete, removed: don't escape ReST-incompatible chars
Date:   Wed, 17 Jul 2019 09:28:18 -0300
Message-Id: <45048cee1d9e89fe45cf5ca43876846175c69543.1563365880.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563365880.git.mchehab+samsung@kernel.org>
References: <cover.1563365880.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With just a single fix, the contents there can be parsed properly
without the need to escape any ReST incompatible stuff.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/ABI/obsolete/sysfs-gpio      | 2 ++
 Documentation/admin-guide/abi-obsolete.rst | 1 +
 Documentation/admin-guide/abi-removed.rst  | 1 +
 3 files changed, 4 insertions(+)

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
index e0d4e5e2dd90..b8b0fd341c17 100644
--- a/Documentation/ABI/obsolete/sysfs-gpio
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -13,6 +13,8 @@ Description:
   GPIOs are identified as they are inside the kernel, using integers in
   the range 0..INT_MAX.  See Documentation/admin-guide/gpio for more information.
 
+  ::
+
     /sys/class/gpio
 	/export ... asks the kernel to export a GPIO to userspace
 	/unexport ... to return a GPIO to the kernel
diff --git a/Documentation/admin-guide/abi-obsolete.rst b/Documentation/admin-guide/abi-obsolete.rst
index cda9168445a5..d095867899c5 100644
--- a/Documentation/admin-guide/abi-obsolete.rst
+++ b/Documentation/admin-guide/abi-obsolete.rst
@@ -8,3 +8,4 @@ The description of the interface will document the reason why it is
 obsolete and when it can be expected to be removed.
 
 .. kernel-abi:: $srctree/Documentation/ABI/obsolete
+   :rst:
diff --git a/Documentation/admin-guide/abi-removed.rst b/Documentation/admin-guide/abi-removed.rst
index 497978fc9632..f7e9e43023c1 100644
--- a/Documentation/admin-guide/abi-removed.rst
+++ b/Documentation/admin-guide/abi-removed.rst
@@ -2,3 +2,4 @@ ABI removed symbols
 ===================
 
 .. kernel-abi:: $srctree/Documentation/ABI/removed
+   :rst:
-- 
2.21.0

