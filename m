Return-Path: <linux-gpio+bounces-30214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CD3CFCE1E
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 10:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F11330124E4
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 09:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E5C2D97B9;
	Wed,  7 Jan 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNdXQgT9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3951617DFE7
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767778315; cv=none; b=aIAbkah2H/SfC42DJdzUtDyF/sWs8MrNijrv+Y6huUARRHIchmEX4eLdaw/c7oxvLjZfQf63hNxWYEZyMO+eRwVyrqBzjosp+jhX0ylBknoqw9cccJSy+CNDSwQkDXFc/m1kG6zLH/M5xdUyBGACkQ2Nne8ZpommTOnD0bjE7cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767778315; c=relaxed/simple;
	bh=SL4jNbeZEI1+nkTGrXJvZLEhXFUFJa7CeOBZacq7IWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GLK9J57iDHUTJpNKo2kfityHCa+1AR/KYzqfpeLOMT8E47QUqJmIDB1y5eRoQFdTyOkLZ9I6tR2hy0r6wwgYgGUEib/73blQHPqJBKNGkGouAAYB4Gpn65YGdTJ8Y403dnVPmkBDpGpDUeka2bBTxKInLJCokQSvRXKnSpvG6fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNdXQgT9; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b7633027cb2so343593266b.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 01:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767778311; x=1768383111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+V9JM8ZWElgqZZrdiMgxMNgv8OJd9DEJ1L+S/izWH/0=;
        b=KNdXQgT9CEOmV32x18qHvy0agLAUtZ3RLpBHaYduK4bcbN0jZxdXehctKr6yqfWvH8
         CwRlAxNhEmDuzSLhL0jtV2AEEERUDmElx7tP0YR1VKXEDwS4pVYVN5syF8YzgpS6fBjH
         6nMGrq7LzDgHZOE2ttJWMlrB0zlfc3V53Faga4HzY8NXm7VL5lNiZrfcIrA030Kemalq
         FqajXRcejhD4HBDrl4tyPcwCpoJHqGWP+/5m+LLtypDyoKNytz48OZsqzdBMW2nCEc+r
         uD8fx5TMS4IIIhw/940b3YxeAZ4qOqi4PXeoT0u3HYWp8RGw4kBWlV/9T4gYknkjNDjs
         TOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778311; x=1768383111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+V9JM8ZWElgqZZrdiMgxMNgv8OJd9DEJ1L+S/izWH/0=;
        b=cEnwG6PEQ0HDKIP6+Grb87vI8fy/uxkqjsgdb40aUbZsFFAjfxKTmonh8lz5ikP5xx
         8O5tsBO+ag/YQYXW6eMLi8uBvUo3XLTxEpIKOFzwXPj2NRwvYD4OoGtebKGObQfUOGGL
         g/aVIwA1LPbh96etRQRMQ7rWj5gMBvvpZG4z+JAZGsdGHnHmRpa+m42RFxKNo6DJ7Os2
         6d9BU9Lltq1FsWhr88rhUKktk8TLtNpgHjAtm+sMJKQpIRc266ufhkqGv36x6zP4hY0n
         CEgjNqsTRFTIMl60F6Hh12s6djj4UgLU5EHVpi+sxdLP0aJDZ6a0Nxdm36MmVXg+F1X0
         Wwcw==
X-Forwarded-Encrypted: i=1; AJvYcCW3PshbxVbVTEnOOc4whhh64raiIX9tLosxUdyoai9cTu7x2mZHWZNxV6SloG5jxdHnGu8YX4KeSaZh@vger.kernel.org
X-Gm-Message-State: AOJu0YxRhni0tUnaNoGywt9d5AxJtIrcOlwPNg+JBf4yT+sGQYyT2ldk
	MxkeYywLALYCJadHwiNz0O75WvYaopzbiMOEpoTvY9zynlkkOhDXEXzP
X-Gm-Gg: AY/fxX5DDqquckCjNATu8y5Evlzaxgb9K6HMeLpo4I4G1QybaxBNHK9Bn7/lknn7qnG
	Se+l/UF5w+9zwJYgFq+Zb1gCDz+oMkCYjWZ7z3pcCxMNnBEEius1iMNlBFq2KgdW7PJmHrqjd3C
	YA2PzJhGAtAMTKY1yOHJRCdrUtNzEGm/GkN7k5hX0o+e6UfmdUKYz0x/mp8ZmHwQgOjToo8lsOj
	MKWn31rm8z0otTmT08K8OMQzaRrYILDnha24A0Hz56Jmh7e4OGbjTa+IegnonxEPuQ1x8oOMWen
	LQWsfpwXqhRbHj7W7qgmSiEla4fmM68+v+8NSeFn8xd8IH1BFlt9R3akT61calpCs0iNF6BcEBf
	NyrK3H3pBYGj6U2AogiIOu5/jwZq3V90+hWdIiPSkddh5h3Sx/79PkgZDYsGAOQRWtWisDf0kqb
	ArNmv1UN2QLabthU6XUr62DTLL2RGkbzylkZEY+IWRmS9zRWikqZHLkFsZPBF7YFnZQ6YhI2Hvk
	OWnqNPomTyRrUhN60YkM8Q=
X-Google-Smtp-Source: AGHT+IHN2t3DCkb0dmUHVIbl1BEhOZmHoBfyIGL+xoDRHJx3mpr43XpNECcaL/w1IjZijF2tGzr93g==
X-Received: by 2002:a17:907:a49:b0:b7c:e4e9:b13f with SMTP id a640c23a62f3a-b8444f4e435mr201321066b.39.1767778311260;
        Wed, 07 Jan 2026 01:31:51 -0800 (PST)
Received: from ernest.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3831sm483455066b.44.2026.01.07.01.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:31:50 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] Documentation: gpio: pca953x: clarify interrupt source detection
Date: Wed,  7 Jan 2026 10:31:22 +0100
Message-ID: <20260107093125.4053468-1-ernestvanhoecke@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

There are multiple design tradeoffs and considerations in how the
PCA953x driver detects the source(s) of an interrupt. This driver
supports PCAL variants with input latching, a feature that is
constrained by the fact that the interrupt status and input port
registers cannot be read atomically. These limits and the design
decisions deserve an in-depth explanation.

Update the documentation to clarify these hardware limits and describe
how the driver determines pending interrupts, and how it makes use of
the PCAL input latching.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
This documents behaviour implemented in a previously submitted patch and
bases some of the descriptions on parts of that commit message:
https://lore.kernel.org/all/20251217153050.142057-1-ernestvanhoecke@gmail.com/
---
 Documentation/driver-api/gpio/pca953x.rst | 75 +++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/driver-api/gpio/pca953x.rst b/Documentation/driver-api/gpio/pca953x.rst
index 4bd7cf1120cb..57e6c613c478 100644
--- a/Documentation/driver-api/gpio/pca953x.rst
+++ b/Documentation/driver-api/gpio/pca953x.rst
@@ -383,6 +383,13 @@ disabled.
 Currently the driver enables the latch for each line with interrupt
 enabled.
 
+An interrupt status register records which pins triggered an interrupt.
+However, the status register and the input port register must be read
+separately; there is no atomic mechanism to read both simultaneously, so races
+are possible. Refer to the chapter `Interrupt source detection`_ to understand
+the implications of this and how the driver still makes use of the latching
+feature.
+
     1. base offset 0x40, bank 2, bank offsets of 2^n
         - pcal6408
         - pcal6416
@@ -511,6 +518,74 @@ bits drive strength
 
 Currently not supported by the driver.
 
+Interrupt source detection
+==========================
+
+When triggered by the GPIO expander's interrupt, the driver determines which
+IRQs are pending by reading the input port register.
+
+To be able to filter on specific interrupt events for all compatible devices,
+the driver keeps track of the previous input state of the lines, and emits an
+IRQ only for the correct edge or level. This system works irrespective of the
+number of enabled interrupts. Events will not be missed even if they occur
+between the GPIO expander's interrupt and the actual I2C read. Edges could of
+course be missed if the related signal level changes back to the value
+previously saved by the driver before the I2C read. PCAL variants offer input
+latching for that reason.
+
+PCAL input latching
+-------------------
+
+The PCAL variants have an input latch and the driver enables this for all
+interrupt-enabled lines. The interrupt is then only cleared when the input port
+is read out. These variants provide an interrupt status register that records
+which pins triggered an interrupt, but the status and input registers cannot be
+read atomically. If another interrupt occurs on a different line after the
+status register has been read but before the input port register is sampled,
+that event will not be reflected in the earlier status snapshot, so relying
+solely on the interrupt status register is insufficient.
+
+Thus, the PCAL variants also have to use the existing level-change logic.
+
+For short pulses, the first edge is captured when the input register is read,
+but if the signal returns to its previous level before this read, the second
+edge is not observed. As a result, successive pulses can produce identical
+input values at read time and no level change is detected, causing interrupts
+to be missed. Below timing diagram shows this situation where the top signal is
+the input pin level and the bottom signal indicates the latched value::
+
+  ─────┐     ┌──*───────────────┐     ┌──*─────────────────┐     ┌──*───
+       │     │  .               │     │  .                 │     │  .
+       │     │  │               │     │  │                 │     │  │
+       └──*──┘  │               └──*──┘  │                 └──*──┘  │
+  Input   │     │                  │     │                    │     │
+          ▼     │                  ▼     │                    ▼     │
+         IRQ    │                 IRQ    │                   IRQ    │
+                .                        .                          .
+  ─────┐        .┌──────────────┐        .┌────────────────┐        .┌──
+       │         │              │         │                │         │
+       │         │              │         │                │         │
+       └────────*┘              └────────*┘                └────────*┘
+  Latched       │                        │                          │
+                ▼                        ▼                          ▼
+              READ 0                   READ 0                     READ 0
+                                     NO CHANGE                  NO CHANGE
+
+To deal with this, events indicated by the interrupt status register are merged
+with events detected through the existing level-change logic. As a result:
+
+- short pulses, whose second edges are invisible, are detected via the
+  interrupt status register, and
+- interrupts that occur between the status and input reads are still
+  caught by the generic level-change logic.
+
+Note that this is still best-effort: the status and input registers are read
+separately, and short pulses on other lines may occur in between those reads.
+Such pulses can still be latched as an interrupt without leaving an observable
+level change at read time, and may not be attributable to a specific edge. This
+does not reduce detection compared to the generic path, but reflects inherent
+atomicity limitations.
+
 Datasheets
 ==========
 
-- 
2.43.0


