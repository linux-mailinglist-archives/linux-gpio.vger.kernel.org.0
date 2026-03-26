Return-Path: <linux-gpio+bounces-34215-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LXGBqlaxWkk9gQAu9opvQ
	(envelope-from <linux-gpio+bounces-34215-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 17:11:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 711FC3382C5
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 17:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53672306B14D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 16:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11224070F2;
	Thu, 26 Mar 2026 16:01:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175A840627B
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540879; cv=none; b=d9+lIIOVH2lEV5Fdwgc9uLPBGBWX+1DJGpT1W2wcf+BVpnQ9Tyr9VVHqPWC5YzGFl40rc5PpwrOIxeZxLaC8mmia9kvUfSWDeWEe+CUcpcrTk8j+5WXKUmwSCCDrqEOc1OEzL/KADt2QtF9ki93PMEFR3rQ17Tv4bkU8Sti8/uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540879; c=relaxed/simple;
	bh=nJJ044CFG8WFf7uTek+YoTRHmmGxlXFM1S9hcGLROjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9fdBjyz/iHBHFLQkLL0Af9vpqplElMU5Aq836vh9M7KReaIfYABVQWHWaHzQJ+l4A950ArZczzLHiBxrby7ul4FM4aqFE9pNiMAtUF+lZCGpLLBe5//x0PQ22vyya+D+2CgpdOVQ824jcdWWhJX6BCGdwrOQ9pLzBy+Sy+W+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5637886c92aso597024e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 09:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540875; x=1775145675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjJkfoCYmqHBebtmH7jbwGZvaBZg+X2t2r1EMwQ2wHs=;
        b=mK2Ri+FW7KQx+ELGwsMMnZJuxjBHyuvOGHY4UDPk+RkPNY+Z3L7Gvx0m6tCMolVBez
         dkwFAYzC3ggRnFHyorqIJPJOpx6+aa3MNbEetqKU5OzzmIPX6G5pRyVrEyXPUdCV453l
         Xi15m9p3cDg1GWiRZTSIRqHd9NLKp6FA+NV7BvpsmSv2MyZppi8cGxLvo48dqFA/dNcx
         LN4ZCZTXSyq3CvUmXJDmBrZ4D73jAcN7f7MiI7PIwbFXQo/EcTHTPE7D1265fe99MXfZ
         pI9C0+jVJ8723YZAuuNy0xPQOBDUSSD2J0CAXqlPYHa/6T65reMecnNUrl397WcDVqqn
         8JuA==
X-Forwarded-Encrypted: i=1; AJvYcCW42hgOFCYpKaeH8QtWvndZnSqW2RmRsOElp0LXH/dkEf1xTg8ByLo0TKQWhKwYamrPtaQaGKMPAs1/@vger.kernel.org
X-Gm-Message-State: AOJu0YxbPX8hwt2Qv6P0Rt4gqsCsqeztfrEku59o7eMq16PfAuWHJY+V
	oN8GE/5ThUSNt7OLriaLYrJff39M+mNcR8Ez3FGpnqhqqm8C0e+mRYt+VGQPgczxMWA=
X-Gm-Gg: ATEYQzzzNZXnt7UN9KJHy6Z/eWbGWcNawXMc8mSZpRqWzhujVMYdvrlSfh3jT0xChPU
	UpETls9txXTMgFO8/0n4dqQMiRyuQVTcx+RJuNv6ijh2RMKiyLyt9bsQt1KIVE0FvwkpmP0wCET
	1YhFKAa5IAEVMmDMgaxNUdJj5R3aRFFBdtoXcaJAk1ha4zFVI0749Rriykg8npH43MFCtVkZBUb
	AHfRVLpRaLeFkMFDsG4bmMVPUOj1vcErvRv73FWVczQCFndoPoJHsKc9bce0xkpkNqLMfBYaWYT
	ERR5i8oNj+dccfASodE5I/5YGis1Q8PRvUmAoGMRuU5y4ePeiCEFFmmG9ITrLf0YB3dvmx2rhwP
	4Q9iEdTEn8X4Rg4OtgwsYkZk7uiGxT/0aaudIsjVXMmnolPF8dVLLJKW4wQVGMGhowheXnne1Lq
	jaaFShW5irldT+p7mK4gF+yskWqYbYiy3aCM6/iNeMsP566/ElmoNnLd7fMdOWKnae
X-Received: by 2002:a05:6122:3481:b0:56c:d58e:8c0b with SMTP id 71dfb90a1353d-56d2208b18cmr3485384e0c.10.1774540873451;
        Thu, 26 Mar 2026 09:01:13 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d81edbsm4652650e0c.15.2026.03.26.09.01.13
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 09:01:13 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56adf76631cso578559e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 09:01:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUptQZM8pJje+TLp6GbUs/a9L075myRi8lDjnsijm5zzT2X8Qw7Xme2qDnKByVIvilcJ9gMQ3oqtJWN@vger.kernel.org
X-Received: by 2002:a05:6122:8c13:b0:56c:ce0b:fecd with SMTP id
 71dfb90a1353d-56d2208bef0mr4303675e0c.12.1774540872761; Thu, 26 Mar 2026
 09:01:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260319141515.2053556-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260319141515.2053556-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 17:01:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXeRRWi1g72p_2Rq-dYO=pD6aLkWC-x5fZpHa7WMQZR2w@mail.gmail.com>
X-Gm-Features: AQROBzAu-o_sjRBfd6AHvLbmqr0rTNnVFjjdYlB7t2PFooSBjTFI7oEHrcpJ_Zc
Message-ID: <CAMuHMdXeRRWi1g72p_2Rq-dYO=pD6aLkWC-x5fZpHa7WMQZR2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document
 pin configuration properties
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-34215-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 711FC3382C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 at 15:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the pin configuration properties supported by the RZ/T2H
> pinctrl driver.
>
> The RZ/T2H SoC allows configuring several electrical characteristics
> through the DRCTLm (I/O Buffer Function Switching) registers. These
> registers control drive strength, bias configuration, Schmitt trigger
> input, and output slew rate.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Updated commit description
> - Switched to using the standard drive-strength-microamp property
>   name instead of a custom one
> - Added a description for slew-rate property

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

