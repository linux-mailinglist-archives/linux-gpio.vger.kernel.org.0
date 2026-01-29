Return-Path: <linux-gpio+bounces-31304-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCKGAul5e2nWEwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31304-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 16:16:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 26882B15A0
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 16:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E235300443A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 15:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A3822156A;
	Thu, 29 Jan 2026 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiS3Pm5I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6393DBA34
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769699809; cv=none; b=TdSaciw84UlhksA5A+cnBibmRw/hy8Sh+dBDA8Ri8k91RHHrSALzCyuO2jWy8ybqHuOuD0DpGB7rRFF2m48h6SH8PEvCcYAZiZbXhU5cV8TajSGf4AY0LT66oadCPzD8qZ5VX2qWxcniC1WCR6CA/iQEF042dolH30Bi8xxIsgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769699809; c=relaxed/simple;
	bh=O1tloW8gfVEMEcBPVggd9EMmWqLpPlFRfEzQCkil1HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5qRJuuzMSOnSw1sWcJgSciRkFCX1GcLUl1dIO0xouAvrnqei2jvtqc5scCM0mA1B7orLNFVT9GzC6RvDb/FJVLKhJahkBsvSxpigvN67g2jVi0vmA64nDgpWVsQKsOd2S2sz7rU5h5CI6FbEyMyFWS3A1dzbTRb5Jf/DevY+OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiS3Pm5I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412AAC116D0
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 15:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769699809;
	bh=O1tloW8gfVEMEcBPVggd9EMmWqLpPlFRfEzQCkil1HA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kiS3Pm5IueYJq5TmZqGrS7X7C+cWyG1KdjBU9oiug7eGGcyzr2O934EguWjN3FDjz
	 gat2aSyrK4fKp5K+S6alGJQvo4aL5TDXGkyr1lEbH+drcNwr3BcQLLDTaNNvLcf0Xi
	 Xww/zptlAVq99/UpW7eL3bzwdZjWV+ansPM7JM9JvgnyVm3cmmydMgusNtXysqT+t5
	 i6bfvNdLW5qgYE0+CTzveGSBq6R2JV+1s8L8e1CvVBVR6xtcoFOP/+ee1u8/s4xTaU
	 DCPzLxwKeW7M0TJja1ZFpyoUC/GEnxOwm9VoOjHuipk19xaZAmreQTZDvMVfbO7DbG
	 FOXOUIoDAUB9w==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8871718b05so189399266b.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 07:16:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXoF+wQS6N/WFYTiy05HBqrE9fCyHSbEb5tIUxVxaCXFB0tqwBpV120+CzypFlvZZtGJkrSTbKX6Ryl@vger.kernel.org
X-Gm-Message-State: AOJu0YznhClvwI9YiTDQScfzwfBcaidQjzFoVOfXSkarV7rxKO3GmC9c
	owo3o6JBi0hrS4OsPXdMiuY25yTzAwqhAcaWGjZWcCJnUI1cQEQHQIpKKTmoQVMz07J7yEm8OJB
	RyAZomDhj/Hbt9EHm/IcJ06PNDmcErw==
X-Received: by 2002:a17:907:940a:b0:b87:65c5:603a with SMTP id
 a640c23a62f3a-b8dab423ef5mr644045466b.39.1769699807795; Thu, 29 Jan 2026
 07:16:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-5-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-5-21b18b9ada77@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Thu, 29 Jan 2026 09:16:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJxfVaLqzTwm7iEvc4maBzVvpc-i5uD6CZRtiv+V+7+1Q@mail.gmail.com>
X-Gm-Features: AZwV_QgoP-01T8gPVg_GjRssieKZeDUA4_1M3p-JswAzI-a2M9jAVmrm9uPisdk
Message-ID: <CAL_JsqJxfVaLqzTwm7iEvc4maBzVvpc-i5uD6CZRtiv+V+7+1Q@mail.gmail.com>
Subject: Re: [PATCH RFC 05/16] ARM: dts: aspeed: Remove unspecified LPC host
 controller node
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31304-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,codeconstruct.com.au:email]
X-Rspamd-Queue-Id: 26882B15A0
X-Rspamd-Action: no action

On Thu, Dec 11, 2025 at 2:46=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> For the AST2500 the node was used for pinctrl purposes, and while the
> hardware capability is also present in the AST2400 and AST2600, the
> their pinctrl no relationship to it. Further, there's no corresponding
> binding, remove the node for now to
> eliminate the warnings.

Odd line break.

>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 5 -----
>  arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 6 ------
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 5 -----
>  3 files changed, 16 deletions(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

