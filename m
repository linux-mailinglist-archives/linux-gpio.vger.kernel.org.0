Return-Path: <linux-gpio+bounces-35405-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHipA7L16WnkpwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35405-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 12:34:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C6F450C58
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 12:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40C6730457C2
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 10:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57F43BE635;
	Thu, 23 Apr 2026 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oUfOUVXB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700D0386444
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776940434; cv=none; b=Vq64bRjbE00ibrtaWZrLJ0diaSKR/Uz6wO+QXlbMdw45o0nAmGp/r28Jd2hWiosaQjmOnp/o4OyoPcxLDVn6AOa2xF7PYpF7TyYEviP7r7WjrlG+9bekguz/+AkVcE0nDxy32w9tgEwRT7rkrvdT6I9jJtpSA05nu4+d0C2UzqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776940434; c=relaxed/simple;
	bh=FuFFPSBds7JdQYwZRc+ISiNU0G+m4ysp9ZWfxhulcHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OSnkSXZXLoqIsZKLfZoUnARXziML10QsBpNFXYmz7eXejmjrLyBMSVb6DgmxJu2og1K/1yB5rpjqpw/2JSV5ZL4IXcfLOgI4NNiI1zNvCFELd7yHUHzlqcOHwIk4FCR0QAotDMGGxjggDtIrLUk3f+a0cdyLo3mXGbdWr7SQSXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oUfOUVXB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2aaed195901so28331055ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776940433; x=1777545233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmnSHj22uqwbFUR/x4tk20OSrPifUESdOxTfNr17BdM=;
        b=oUfOUVXBPbTgwdYdJs9rWCyCOeA+A9tPZls9eU+bOn1wrZPuY17DVDTGa8+xmeJlsW
         1cyQTWbutitdAauFbmIxFfyayKzcypOKbuS3SDdBYk9Xz6D3YzXHvjCpidwGV9Oa0u6p
         qopZ9d8p6vcceBkvsqjZgH/CKqALDAdcKSdT0caz/eeNgoboAqLayHIw4wNw9mXAXDRz
         tqhd+egC0SGS7InJyV+myAqjxxlhJxR8xzht2JK1A7EtDE5355dn1qQeUN89sCiGA9qt
         aqCv0Ow35DhbY1IxAOs8pAm8JK7U6zXqfZAWDynql3nejgXtM2D4GqBxdM2Pu1wi6dg0
         tEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776940433; x=1777545233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmnSHj22uqwbFUR/x4tk20OSrPifUESdOxTfNr17BdM=;
        b=GItphUpO8Yr8W4qZ5PloT1MaYOtjCXm3Fc5gk0S3ILMnDDgpQgVT+UATpR2u8qZuTq
         sI6vYN85leTCz5K0Ezgr8cZtqjfaR2kewlIkSsnZvzmT0BMj6WYq4rNd1RUXkIyXRGTc
         E4oHci8jQpR4yMZvekJw+PlTYorCxTj4kF23bnWrl8cKFDUvX3OXgof/KfKQuVOcQHeZ
         OasrYv2thyP88HQbTC0POnc1kVJjDjuJPEQGQw+03XGieP9EkNCDxP/bmBR6yLCWgeiX
         AIgxUuTWQ2y8DiB8fXZPYFoFlE/wmBAllkBX2M/gOWiGVzjJStee5K29FCcReZlQsU9Y
         GvAg==
X-Forwarded-Encrypted: i=1; AFNElJ/zpth6QQYNaaHG9CAevZEKHQayNmUvtSTLZMF1iR4W7eacUDzwNAszL7au99cr+hFccAV+r4DuGNAK@vger.kernel.org
X-Gm-Message-State: AOJu0YziQMyJDoyBZ1y/HsFi2a/1zMS6JGH9LnqHYiFHI5J4krFlzcqA
	bsg3iCDJ/juTeU/npoSOz0Wwhxi0eSy4JJyUIJ53CrSIzUyo84gDvEUS
X-Gm-Gg: AeBDieudiVkgSapB5P6YcSbzY3i75mWXkGzUhPvQsT8aMIi/ptLCJdA5rVrArNJk/q8
	PO0XSEhmdLE+gV+J36+uGWDMeft5iojGXDlpQ89YGVNfT4BBbiEgO4cDVFnFHuihmzIMrUuj5z/
	6iR9AQJYm7RLsEYnbuMzvAwnlXWcCI/wBR7f+qr9pI8z5l6DY/e4oLToKeTWYviuTk4grOebD7n
	rTojqMjEnPLA7G2PrPVnKjyvjTaodBNLffTC8Mg4TX0ICntV2856c8hYlucddtCJsUmNUVDR0LM
	hb1xGg8Qf6XT1Ld4nKg+EF/EsdZnMMGCPAbKluWjaO3q2j0/WNvkz7MAm6rtsYKypAe67LEeOkb
	2X6bSZAx5lafnN4swhHnTHE9sl0odB84DVKOQrHrkZrUMRffIEOJwHVHiK+IJYOzbt+grxVU2m2
	yNMRcUymvQ6sSodNT7YLkDfGImt109w86s4m7WoAQsvgNWdzcnowo/OdYZ1XhaJHFrCcTyrbCxB
	Kg=
X-Received: by 2002:a17:902:bf4a:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b5f9e79fa8mr205033755ad.5.1776940432649;
        Thu, 23 Apr 2026 03:33:52 -0700 (PDT)
Received: from happycpu-p1.. ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab30f29sm189376925ad.68.2026.04.23.03.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:33:52 -0700 (PDT)
From: Chanhong Jung <happycpu@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanhong Jung <happycpu@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: gpio: fairchild,74hc595: add registers-default property
Date: Thu, 23 Apr 2026 19:33:47 +0900
Message-Id: <20260423103347.4054425-1-happycpu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423-quantum-precious-mantis-2481d7@quoll>
References: <cover.1776872453.git.happycpu@gmail.com> <33d515f13769c685e6811463a14e111252a7c58d.1776872453.git.happycpu@gmail.com> <20260423-quantum-precious-mantis-2481d7@quoll>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35405-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[happycpu@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74C6F450C58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

Thanks for the review.

> You can fix the driver not to do that. Or fix the driver to properly
> parse hogs. I don't understand why exactly this one driver needs
> default registers stored in DT, but all other drivers in the kernel
> don't.

I thought about both, but I don't think either works for this chip.

74HC595/74LVC594 is pure write-only: no MISO path, no register
read-back, and the data sheet defines the power-on state of the
parallel outputs as whatever /SRCLR and /OE do before the SPI master
is up. That's different from MCP23xxx, PCA953x, STMPE and the rest,
which are either readable (so the driver can RMW) or have a defined
reset value. None of those drivers need a seed property. This one
does, because there is nothing to read back and no defined state to
fall back on.

Partial updates aren't possible either. set_value() has to shift the
full chain every time - see __gen_74x164_write_config() - so whatever
is in chip->buffer at the first ->set() call gets published to every
output at once. If probe doesn't seed the buffer, the first
consumer's set() runs off the kzalloc'd 0x00 and publishes that.
On the board that motivated this series there are 16 active-low
indicator LEDs on the chain; the 0x00 publish briefly lights every
one of them before gpio-leds finishes walking its children. That
glitch is what the probe-time write was preventing.

gpio-hog isn't a substitute here either:

  - gpio_request() refuses the second claim on a line (EBUSY), so a
    hog and a gpio-leds / reset-gpios consumer can't coexist on the
    same line. This board already has gpio-leds consumers on every
    output of the chain, so there is no free line to hog. In general,
    if a line has no consumer its initial state doesn't matter; if
    it does have one, you can't put a hog on it.

  - Each hog is applied sequentially by of_gpiochip_scan_gpios(), and
    because partial updates aren't possible every hog produces a
    full-chain write from an intermediate shadow. Seeding
    {0xFF 0xFF 0x00 0x00} through 16 hogs walks the physical pins
    through 16 intermediate patterns. A u8-array property collapses
    that to one atomic 4-byte transfer on the first SPI transaction.

  - bindings/gpio/gpio.txt describes gpio-hog as a mechanism for
    lines no driver claims. Using it to paper over a missing
    probe-time seed is the wrong semantic for a chip whose only
    hardware primitive is "shift the whole chain", not "set one bit".

On the vendor prefix you're right - "registers-default" is too
generic. In v2 I'll rename it to "fairchild,registers-default"
(scoped to the fairchild,74hc595 compatible), which addresses the
can-of-worms concern without changing the semantics. If you'd prefer
a more descriptive name, "fairchild,initial-latch-state" or
"fairchild,power-on-pattern" both work for me - let me know which
one you'd ack and I'll send v2 accordingly.

Best regards,
Chanhong Jung
<happycpu@gmail.com>

