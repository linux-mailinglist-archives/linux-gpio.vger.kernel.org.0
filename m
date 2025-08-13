Return-Path: <linux-gpio+bounces-24344-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E78B243DD
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 10:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 636451A20097
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 08:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA02F2EBBAC;
	Wed, 13 Aug 2025 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="xygMI5Vx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CBE2EA48D;
	Wed, 13 Aug 2025 08:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755072840; cv=none; b=nNTDVHQSU1/SOFzJ3Mz/bEqL9LCcAl3GpchG8p3XLj0uSlAnja8i5x/bAnzrwGI7H+80cbzVrMmOLwUt1O6b45ceiR2Udx+XxE5jb137shkVyLY/o9dew8/Ay9El3vP7YmgiFUpvS6dIbIyvqZtFq6R/KGJ6MkeIu7ffrwpibCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755072840; c=relaxed/simple;
	bh=4m/GuqmU6RHDkX+fnyNpbxuJSwoOYXxyAf+7BLsKMpE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a55u/+twHVEhPecO5B0gz+NAFK2XN4YYYxoPDsnApd1m0DDK/k/NA/GugbnZzuEVKfj308btuy4bu6STT7q6vA8nt4r0/uv65ZnAEZSuS4DlkrF3zW1C0oBolh6t64PokWBtx7uqDrva056yVFiawf9ArCALA2m0fuC+sjALd/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=xygMI5Vx; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6UGTT009918;
	Wed, 13 Aug 2025 10:13:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	fBvmoYYX3DaYWUuJjMDCDSzgpHp+489gIksWIi+kdmk=; b=xygMI5VxdvIL14Bc
	+yDe8ogUERvEAPC3NC8SKzwXbxpLzhL4xWXBCeIxkrwbZh8Sruz9puHjBuHfCd98
	kHqCyf+sRM2qVaaQaTfgsUiNQm3Cr26ryMlDI/Uy6+Fh++jKKgoIcB66CbaezayI
	No6pjC4JsB6h1T95Nc9PmTbIIS2y6Nrh+T7NPkHwsTxKN5vNArgnmmLrAFGY249p
	pirjD5fGUZAiBBQJxZJ3pFAYAMQ9yL4sW/AvIs+PxgVjRzqCzaPi3oWrAjjETFb2
	432zwQvt8QV0SbEkH6mGVC8aCxrvO2ofBFHibTejP/p+CAkp45pd6sXuiQqrR3mG
	FZHgfA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48duf8wv8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 10:13:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 18A364004A;
	Wed, 13 Aug 2025 10:12:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CAFF67206CD;
	Wed, 13 Aug 2025 10:11:58 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Aug
 2025 10:11:58 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <linus.walleij@linaro.org>, <corbet@lwn.net>, <bhelgaas@google.com>,
        <mani@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v1 1/2] Documentation: pinctrl: Describe PM helper functions for standard states.
Date: Wed, 13 Aug 2025 10:11:38 +0200
Message-ID: <20250813081139.93201-2-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813081139.93201-1-christian.bruel@foss.st.com>
References: <20250813081139.93201-1-christian.bruel@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01

Clarify documentation for predefined standard state names 'default',
'init', 'sleep', 'idle' and their associated PM API.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 Documentation/driver-api/pin-control.rst | 57 +++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/driver-api/pin-control.rst
index 27ea1236307e..204cc3e162e2 100644
--- a/Documentation/driver-api/pin-control.rst
+++ b/Documentation/driver-api/pin-control.rst
@@ -1162,8 +1162,55 @@ pinmux core.
 Pin control requests from drivers
 =================================
 
-When a device driver is about to probe the device core will automatically
-attempt to issue ``pinctrl_get_select_default()`` on these devices.
+When a device driver is about to probe, the device core attaches the
+standard states if they are defined in the device tree by calling
+``pinctrl_bind_pins()`` on these devices.
+Possible standard state names are: "default", "init", "sleep" and "idle".
+
+- if ``default`` is defined in the device tree, it is selected before
+  device probe.
+
+- if ``init`` and ``default`` are defined in the device tree, the "init"
+  state is selected before the driver probe and the "default" state is
+  selected after the driver probe.
+
+- the ``sleep`` and ``idle`` states are for power management and can only
+  be selected with the PM API bellow.
+
+PM interfaces
+=================
+PM runtime suspend/resume might need to execute the same init sequence as
+during probe. Since the predefined states are already attached to the
+device, the driver can activate these states explicitly with the
+following helper functions:
+
+- ``pinctrl_pm_select_default_state()``
+- ``pinctrl_pm_select_init_state()``
+- ``pinctrl_pm_select_sleep_state()``
+- ``pinctrl_pm_select_idle_state()``
+
+For example, if resuming the device depend on certain pinmux states
+
+.. code-block:: c
+
+	foo_suspend()
+	{
+		/* suspend device */
+		...
+
+		pinctrl_pm_select_sleep_state(dev);
+	}
+
+	foo_resume()
+	{
+		pinctrl_pm_select_init_state(dev);
+
+		/* resuming device */
+		...
+
+		pinctrl_pm_select_default_state(dev);
+	}
+
 This way driver writers do not need to add any of the boilerplate code
 of the type found below. However when doing fine-grained state selection
 and not using the "default" state, you may have to do some device driver
@@ -1185,6 +1232,12 @@ operation and going to sleep, moving from the ``PINCTRL_STATE_DEFAULT`` to
 ``PINCTRL_STATE_SLEEP`` at runtime, re-biasing or even re-muxing pins to save
 current in sleep mode.
 
+Another case is when the pinctrl needs to switch to a certain mode during
+probe and then revert to the default state at the end of probe. For example
+a PINMUX may need to be configured as a GPIO during probe. In this case, use
+``PINCTRL_STATE_INIT`` to switch state before probe, then move to
+``PINCTRL_STATE_DEFAULT`` at the end of probe for normal operation.
+
 A driver may request a certain control state to be activated, usually just the
 default state like this:
 
-- 
2.34.1


