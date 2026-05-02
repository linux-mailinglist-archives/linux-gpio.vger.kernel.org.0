Return-Path: <linux-gpio+bounces-35988-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UaFbCxVy9mloVAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35988-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 02 May 2026 23:52:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 220FD4B388A
	for <lists+linux-gpio@lfdr.de>; Sat, 02 May 2026 23:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9F3B30028CB
	for <lists+linux-gpio@lfdr.de>; Sat,  2 May 2026 21:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A80C2FF176;
	Sat,  2 May 2026 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/fYaeLq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D94720010A
	for <linux-gpio@vger.kernel.org>; Sat,  2 May 2026 21:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777758733; cv=pass; b=HzkGwFwximqtx3bzjjy1PAJ4Urtpp6S6oREO/TaZNw5O60MwKJSffn3ysUDPkVD+NsSgnWf8oooAn8WD9HwLF9giV6TfoYe5tCH0nzO2C5maZ9drbX1M4h+O+W9rnJqLUoy0SnXEsTwhW2p7XiPjNOoS1ZX5YjCI2qfZiOg8EMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777758733; c=relaxed/simple;
	bh=LqQtj6QggZSNGk9hzIxmtPC+2GmjdVQKRjPTyze2yP4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=p0gONPggdN1Iwauulk4bFTtO3ewpo2Q/Hj93n2mK/dKWthvuEQu5A9E9vq+b1ELQRnBmQxIR3e5OkfYUCC9B669RQSGKfJV6ezuU/fMaZyQ7KtTCmAJXEYkzNVGCjLhyUNYZU3a7GbAjMtavJDj2Hwhqa/btWUbaE0tvjQzqS8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/fYaeLq; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-956849ae1efso880014241.2
        for <linux-gpio@vger.kernel.org>; Sat, 02 May 2026 14:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777758731; cv=none;
        d=google.com; s=arc-20240605;
        b=Gnyaak+sBwLG2S7YY5yke7EX/vVJ7mBPLBFk/taQxuTosH+FokWYhQd70ciCS9Nmxq
         bkBphmw/QxlhESjioVhxScXMxSrfZm+5WyGEs5eEGKewu5HXT4L6PU7uGzw76sbHlL2x
         OivQxJhzWXYSn5/wMtrRQKJ+K5BsJA1Qfln0MWXRaF7KyZ+zdliAokbCctdXcJCdq496
         TfOxrIHXci/vqrp6m1F30PH22Lil1BEsBXTin4cf8xhP4CSpDwKAhmzQ5g51w7lRLAKz
         2R9pT54pCnUI6CVngQXcOKH0GvTCr5YDnoZDun8IyIGlUgzuo8tj+sPCjAzqadJo9u9x
         Qx5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=sPZjd2zvcbyFlXlX1KLQTQuzLyVUuoHKA2p+mdP4d9c=;
        fh=zz9ESERmLYyazJqlO51AXvF2AL8bRU9IgsRVe/5gkkI=;
        b=jV+NA6xHA3YPnfF4tDtQRAj5ZunZo6UnTwgkhjr9OuthSXyTuz+NDOsNcpRdL6g8EH
         pIWOWWio2AJcpz16MbRa4Jb2M3EIRgNBupBnHFC9e7Cj4O/0g+T5aNkl6sSv+J1pPPfz
         bhCftfWmaoct5l+asHaMVCZC49pre5RQN7Fvn+ySEdV1s14C+NpW1qLYInl794TOqfGk
         pyv6gVUokdljq2OQoz2J9lZyN7L8CzWAfSegyDLOGXMPlvh3RHcn5IKVy9p4mEcYmw6R
         X8HO6vZvdJvB9Gfm6C5dbowrCNk+E1mPmUq/hpqNPBQ+CAYR32PDEe44bagR0QN8cHNL
         OmTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777758731; x=1778363531; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sPZjd2zvcbyFlXlX1KLQTQuzLyVUuoHKA2p+mdP4d9c=;
        b=D/fYaeLquJGFPvzpZLgHWsitLupWkUeKA0WG+Sev3zRPmWVBlyyIDkRR36Bn+99cQG
         vp6TxpUANP4j4t3u6kFIX8MCVdatWGx2GdHQmXj9Tzb7PFsq8+S3WaAbNoC5y+ECmJVG
         GEbON8OKpnDTHOcS/BGLh3rAMh++F5ty2VAivLcLntIsm47B79nJ9UljqxNlECEEqUeM
         tG9TCA7lSud0m6+FhI8kY0/zRYqmoSetRyRhzcW/iUweXVhd1aXXWwPoBJqvCcHNQu55
         prBs09e7lCLQSXiHrm62Vc8gHayfLnh7Z7HnjK3Sc2P2FrTKS/4BqDsaOD/VUXDMMi1e
         hfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777758731; x=1778363531;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPZjd2zvcbyFlXlX1KLQTQuzLyVUuoHKA2p+mdP4d9c=;
        b=C368SFUPHZ+iPfGBxSuc0MS3IoqtgDuURQBegitIxY0c/lqtuTwNtk+OkWZUQssTNT
         O+WIzOYr3Yfb09yh/la9oWpVuDxNB5R7FVFgzgBH8XErz3XsN69emZucoGdbBv6y9GDB
         jzg4vluGs+NbQDSYZ9gdiQvxlHCl10DgjgBcxCE63oPmqxRxJg4nwkMCpFk+mjcJHkdR
         bA/pmMY3/y2smmXeWrMqXJcQGo430rCelA38nI9Tg8mXJWPSRCKagwtY/3CrWdfCLwBf
         n/J093DVDVvYlVoqifZAqfovdnlcYE88F0Xi+1TLA0rGkjA3eNjlfmm8jm+qCOy2o3Xe
         gw6g==
X-Forwarded-Encrypted: i=1; AFNElJ8o0gDtW4rQCSOelxwJ5dyRXg49WxrFCUKS5EC0OhW0AShKuiOpLkl9521L+S7a53LRos/A3bcPI6vS@vger.kernel.org
X-Gm-Message-State: AOJu0YxoEx+urBShBO0uEuL45JtAA+Ivv0RCXQAhufOMaNwOQBvm5C3H
	l4yPpyIP0wo765BbZfrQgcn89CL/It0rEwTPR3bh5794CDzUYkLhmKCnPCwoox0utiZ6R06RdGW
	7EWyXa466jfpQ5d/h5eAYt33RfWRnwOFkxJds
X-Gm-Gg: AeBDiet4l9o53jZPey97gWlvtTOoGESbEdR6Rq4sFNt0Uk7JSQajKOKHEB/dkRn62Uh
	+ZQPEyGubRKAgpRcLbdtrDfjn3doiVBu5gvZQ2DzQwiLnLzady3X0/m89e/4FlPmrVKRiTXEEhS
	YJBVMH3aY4Cgflm75GLeC5ASjKs3FdNgjt5woaBSqjEHPWdxuAF/5WQqQEO0zFwufGHoHRJTLrB
	bbm+Tfk0MlYIbGg6etvOaZvP5nA8GDCW5vXJ7QWZDiypMgUuDuUFtzhRzG+m0vjDdwIQw7wS+Yn
	aaWITwarFEQGkXGDTV0AspEyF04Rb7rFEhSb65M9xdplPU3D
X-Received: by 2002:a05:6102:4b07:b0:608:cdd9:21ad with SMTP id
 ada2fe7eead31-62d84a5e573mr2023470137.5.1777758731352; Sat, 02 May 2026
 14:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Vicente Bergas <vicencb@gmail.com>
Date: Sat, 2 May 2026 23:52:00 +0200
X-Gm-Features: AVHnY4LyRBywdXlbR__5FvY6Hmd9edTzaPB4z2QZngbpCQrAUA62aIk0zb2Ffgk
Message-ID: <CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com>
Subject: gpio-mt7621 unroutable IRQs to bank0
To: Linus Walleij <linus.walleij@linaro.org>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 220FD4B388A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35988-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,kernel.org,secretlab.ca,linutronix.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_PROHIBIT(0.00)[0.0.0.38:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vicencb@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi,
Grant Likely noticed a potential issue and
documented it as a comment in kernel/irq/irqdomain.c:
 * We might want to match the legacy controller last since
 * it might potentially be set to match all interrupts in
 * the absence of a device node. This isn't a problem so far
 * yet though...

There is a bug that is affecting me and
it is triggered by the forseen potential issue.

drivers/gpio/gpio-mt7621.c is registering 96 GPIOs,
all of them capable of generating IRQs.
But the `struct irq_chip` can only handle 32 IRQs,
so, 3 banks are instantiated.

The DTS file specifies the interrupt for one device as
 interrupt-parent = <&gpio>;
 interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
which should be routed to Bank0 GPIO0 but
it is instead routed to Bank2. This is the bug.

The call trace that leads to the problem is:
 drivers/i2c/i2c-core-base.c:i2c_device_probe
 drivers/base/property.c:fwnode_irq_get
 drivers/of/irq.c:of_irq_get
 include/linux/irqdomain.h:irq_find_host
 include/linux/irqdomain.h:irq_find_matching_host
 include/linux/irqdomain.h:irq_find_matching_fwnode
 kernel/irq/irqdomain.c:irq_find_matching_fwspec

As a way to prove that this is indeed the problem,
the following workaround makes it work.
It just inverts the sorting order of all matches,
so it picks Bank0 instead of Bank2.

--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -538,7 +538,6 @@ irq_find_matching_fwspec

         if (rc) {
             found = h;
-            break;
         }
     }
     mutex_unlock(&irq_domain_mutex);

For a bit more context, the platform used is an mt7628an.
The problematic device is:
&i2c {
  pinctrl-names = "default";
  pinctrl-0 = <&i2c_pins>;
  status = "okay";
  ft6336u: touchscreen@38 {
    compatible = "focaltech,ft6236";
    reg = <0x38>;
    interrupt-parent = <&gpio>;
    interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
    reset-gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
  };
};

Please, can you fix this bug?

I'll will be able to test, but because my platform is only supported
after applying openwrt patches, i can only test on v6.18.y.

Regards,
  Vicente.

