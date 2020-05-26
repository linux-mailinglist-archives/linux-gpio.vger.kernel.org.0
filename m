Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834581C873D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2020 12:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgEGKtZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 May 2020 06:49:25 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53705 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726074AbgEGKtZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 May 2020 06:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588848563;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=BEUh2QIFXXLvv2dwamDy5GA1DUcQGCNNDhH7clDR2zQ=;
        b=bdezBYQgxVIUoPsCkBHxEkYuOuhZ4xjfajbJZJS1gGNIL7xH8OCd9GtH916+6/WK+OCBlD
        R4woIxCEcLPkr12pYSj6ZR1jZY/F/dFXhnoUaUoXATp+PDRxrcRaEwCGVfh4BSX3LGjWuc
        5fv5B+qfsKd1vGTbONV8cOAOpUjC2gc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-a2fs5XMLMgOxBCmmrwq2cw-1; Thu, 07 May 2020 06:49:21 -0400
X-MC-Unique: a2fs5XMLMgOxBCmmrwq2cw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4228D80183C;
        Thu,  7 May 2020 10:49:20 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-120.ams2.redhat.com [10.36.115.120])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 51C6060C81;
        Thu,  7 May 2020 10:49:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/2] ACPI / utils: Add acpi_evaluate_reg() helper
Date:   Thu,  7 May 2020 12:49:16 +0200
Message-Id: <20200507104917.116589-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With a recent fix to the pinctrl-cherryview driver we now have
2 drivers open-coding the parameter building / passing for calling
_REG on an ACPI handle.

Add a helper for this, so that these 2 drivers can be converted to this
helper.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Fix spelling error in commit message
- Add Andy's Suggested-by and Reviewed-by
---
 drivers/acpi/utils.c    | 25 +++++++++++++++++++++++++
 include/acpi/acpi_bus.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
index 804ac0df58ec..838b719ec7ce 100644
--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -605,6 +605,31 @@ acpi_status acpi_evaluate_lck(acpi_handle handle, in=
t lock)
 	return status;
 }
=20
+/**
+ * acpi_evaluate_reg: Evaluate _REG method to register OpRegion presence
+ * @handle: ACPI device handle
+ * @space_id: ACPI address space id to register OpRegion presence for
+ * @function: Parameter to pass to _REG one of ACPI_REG_CONNECT or
+ *            ACPI_REG_DISCONNECT
+ *
+ * Evaluate device's _REG method to register OpRegion presence.
+ */
+acpi_status acpi_evaluate_reg(acpi_handle handle, u8 space_id, u32 funct=
ion)
+{
+	struct acpi_object_list arg_list;
+	union acpi_object params[2];
+
+	params[0].type =3D ACPI_TYPE_INTEGER;
+	params[0].integer.value =3D space_id;
+	params[1].type =3D ACPI_TYPE_INTEGER;
+	params[1].integer.value =3D function;
+	arg_list.count =3D 2;
+	arg_list.pointer =3D params;
+
+	return acpi_evaluate_object(handle, "_REG", &arg_list, NULL);
+}
+EXPORT_SYMBOL(acpi_evaluate_reg);
+
 /**
  * acpi_evaluate_dsm - evaluate device's _DSM method
  * @handle: ACPI device handle
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index a92bea7184a8..5afb6ceb284f 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -44,6 +44,7 @@ acpi_status acpi_execute_simple_method(acpi_handle hand=
le, char *method,
 				       u64 arg);
 acpi_status acpi_evaluate_ej0(acpi_handle handle);
 acpi_status acpi_evaluate_lck(acpi_handle handle, int lock);
+acpi_status acpi_evaluate_reg(acpi_handle handle, u8 space_id, u32 funct=
ion);
 bool acpi_ata_match(acpi_handle handle);
 bool acpi_bay_match(acpi_handle handle);
 bool acpi_dock_match(acpi_handle handle);
--=20
2.26.0

