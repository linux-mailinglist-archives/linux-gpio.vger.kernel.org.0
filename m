Return-Path: <linux-gpio+bounces-30369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41860D0B53B
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 17:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8BFD30146CA
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 16:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C5E364E9B;
	Fri,  9 Jan 2026 16:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VqThEY/6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PSJBqq+h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4397423EA8D
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 16:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976941; cv=none; b=nM2NEXQsjBeqTFbwxAOirVHc0mbVdIcpHn/+i3ab0tM0YQrm/ajMSk2ikgWnyEWdiX4w1tO+1RXe9zYdDgkhMYbyaSBEnP18HscIVPqaVM8V6DTBtMaJdpHaxQr3ttVyo5TaAwgRzjCaCjpyFwLjpKGH1nVYd51GBvjE2dUFZIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976941; c=relaxed/simple;
	bh=RLFFqIbNChTLd4hG/k1yf98Cg/hVXZ0JejaL07+IA3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aTZCby5nR2DhBhHMhL2hJ6WRG8dQ8dJfskEdS+U3rhz+V+ny7UVnuA6yF8TbIn3Z0paj0MI05IfuegN7P7gCW5y4oY/uG48zO/1H9vY/fBbqaQQ3SFAcGH5U6mIgeE0tTSARSfbfYmaVgA89W89+4jWhSmEHFkbnO+qnY2sYTiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VqThEY/6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PSJBqq+h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SW/S2wVzYZM3vBT8Rf+7gMzDg0CTydTG7cmC8sQg+jk=;
	b=VqThEY/6nuOQSXfwDdmC8UDrGtkQHppnPldFAl3o2glbIbTuUiAiWyiexu0VEKxBMTYrN7
	iRVCE813jthL/acNaenGuyF99fQH/TwP4YWqg1FCLCatsYN8uy/f6fO6PXELDK7m1bVcS4
	UVbgMGGcSxPpfEEREkRrW6Tr6hVwo3g=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-l53IF3FQPWmtnsGkz7dQ4A-1; Fri, 09 Jan 2026 11:42:16 -0500
X-MC-Unique: l53IF3FQPWmtnsGkz7dQ4A-1
X-Mimecast-MFC-AGG-ID: l53IF3FQPWmtnsGkz7dQ4A_1767976935
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56364ccf7e4so695785e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 08:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976935; x=1768581735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SW/S2wVzYZM3vBT8Rf+7gMzDg0CTydTG7cmC8sQg+jk=;
        b=PSJBqq+hiUIQU0VMUChg06oR3t33E5BdBHkbQA9m0FySHVqYXIWqBX7stGK9H6+2ns
         9c4zKxgBfZ4blo+JN6CTeKzqU7Rt86eJvHJZ0AHD8DSGamcd4dIS5qhPswGNfGgY8her
         PpErjiY8GpARxSxcBVU/3SapR3erAwxb5BxYdTUKM0XzvVI3jgn5O7mtQOSkhlWBeDYl
         2UIQ613juhW2DfZ3rhu+7WyiPxaCHLkpfBK3HR2le6Oi/O8ujceewY7zDCm7hn4HZoBW
         DUgP0ZlZKQyoUk1QrTdRojE6uRdH9cKP7/HK49EmWf6Dq/Li98SrZoggqTLH+vWX9OGZ
         Z+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976935; x=1768581735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SW/S2wVzYZM3vBT8Rf+7gMzDg0CTydTG7cmC8sQg+jk=;
        b=Y+IkwjBuR6aya50QOOygEo6aezREWnOEwwfwCDqE4psNUNh/8Cvwtx6Gc+SuiLWycE
         dJgQPhQpgb0YhG1G5xF/XZnv8psP4KsXarbBOTUU0tRYxEF2vwPwaVlmC/oTBwb1ptKC
         LTsH+6rlvYeHDAaUCP0+DFO5BCeQg+DsP6u8uokXKFlxFUj1kVLEJjJQcfZn2jVzcJyP
         STQ4AAafqcc9PONIyz0lZEysnPya0vnspgZ2I54ZwZElCfSgKo5HIQ63Vd7nJvgnlwYu
         EU2CmfsOYD6IOBfNpAhbDe/VdtR2TVcT/DPFXt4p9lPWsRUhU8SksFyFq8mw/lenVcXB
         kzvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGc9+racKeA1t70aeN4yW/as9CL8rmhLy+V+DZGX6rtjBPkp4DMFNSJNJ/6gj6XjsfX8bccUF1D/lv@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdl2b/BM08FwQXzBrBZatMJvJwktOb+tfBs6ijYGI51B1VCqzo
	rlFVKQ8kgdAkKdInya60Yg+bkkvqNmspWjYmUlpecLz7AK1Gv+SLwnJBsKCFrLTmxgHhmEfDF4O
	6lEmjIJC8D8laKwefyc2xN/rwGV6zlaMnLWIBPCaLDJd7Ff+g3pYTRsSBUyjbtnw=
X-Gm-Gg: AY/fxX4ufZJm5uxKsPACyowB7/G8qI2+GJYEQ4FmJ18fWZYORk+zI11JujJLYWRG0/p
	P6HUvlmo9u75ifheZofuZnZywh0f1DPsRe6dHWUlxnwgjK6af82Hq4/AIospO/q1XJN0NEpMAFj
	OsW52C/klgd5jASn97iPATtabmKtdmHI4Z+1iqwExomFQQKbet9NkYDV+XSa1N3S2kwyVIYYhdA
	QZtv1jLgxAH8OJxv6Riy/+5lPl20t1KKZyPce09OMB9p1jXEg2U0hH1f7M5HHXLDhKM/zl6WEAY
	HVJUTrZVutmXAygXMJjNWnyZLhcncNs6WdOP0TCuMFSg+ZFR0fp3tHjGdAFO5opw7+MYhh4R2/n
	vO6Oas9NEIWGDXTAH8aR8CYzWYLcoSOxMb3ML7e6NKsc/IGT6
X-Received: by 2002:a05:6122:4d03:b0:55b:1938:9183 with SMTP id 71dfb90a1353d-56347c355abmr3211873e0c.4.1767976935545;
        Fri, 09 Jan 2026 08:42:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoDt0JNmFKMl+/9Clw5JcowtJ0iZKm1U0atsvuEsRhEvCvwcQSMRY0KEZfDEDK1POtvMYvgg==
X-Received: by 2002:a05:6122:4d03:b0:55b:1938:9183 with SMTP id 71dfb90a1353d-56347c355abmr3211863e0c.4.1767976935163;
        Fri, 09 Jan 2026 08:42:15 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:42:14 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:20 -0500
Subject: [PATCH 07/13] pinctrl: pic32: update include to use pic32.h from
 platform_data
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-7-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=RLFFqIbNChTLd4hG/k1yf98Cg/hVXZ0JejaL07+IA3E=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y8c272sO6s6dvbOihwLMYGPTDYveI9t3v1h9dLSv
 c5hOetFOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZiIJS8jw1IvA6s7CmUchkE/
 Pe5u+TdbI3ozz8UczcOSKe7Xue+EbGNkaOTu+L60NJTNRVuwYGnOrrfKxXMaXCzrjcR2ndvTldD
 LDgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/pinctrl/pinctrl-pic32.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index e8b481e87c779291a69490de1892fbb7ec9c45f1..16bbbcf7206288df5f91870e6233970582f7ef80 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -15,13 +15,12 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/platform_data/pic32.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
-#include <asm/mach-pic32/pic32.h>
-
 #include "pinctrl-utils.h"
 #include "pinctrl-pic32.h"
 

-- 
2.52.0


