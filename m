Return-Path: <linux-gpio+bounces-35517-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sENkKjfX62lISAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35517-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 22:48:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B3463527
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 22:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DECF303388A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 20:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214CC3FCB23;
	Fri, 24 Apr 2026 20:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TiAF+I5R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A9D3FBED8
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 20:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777063699; cv=none; b=VoFVMVL+CafkoK/hs9Eu40BglkrPo5BmzwYGEFGmfhsFScriPIz2Lx2mr4Vfyrs+h+XV2z6v2NGYnEXyCduZ+l2/zpZBTbD0F093SGy9M6PJOg2YMe/I7fkVS9z+y4DYRcb/16oyjBNXUgPNGnaFASZN27X3BBlNDzwJF2oYFyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777063699; c=relaxed/simple;
	bh=0boLH8hWc2dXkhxszeQy6lSGDQIbpwqKKGbmn8fEX2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EU82BZQ/ECqTM2NVTJQlPsjnDMAQ2OzJTbU3fpUExjTp/GwVBTwqg9onX1w55wId2CT0CVDmWkwJRBV1QNM+Kw6vRGcUhXwvuI+8Ie8174tQ7kECqwkE97Fv/Dzv810EB2HSiMZgZO015yKdqyz2lMOiNjY+9U3xuoyTh5pvo7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TiAF+I5R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20E6C19425
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 20:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777063699;
	bh=0boLH8hWc2dXkhxszeQy6lSGDQIbpwqKKGbmn8fEX2g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TiAF+I5RqpU6/3gkqIvpr3PX82e4NbyOw55hHZqWrDFdzu3gtTQu7vkDFPWEKv9wl
	 ib57LMFwSFZdPwCZlqsQMt90WiZ1j587RV3+pY1B2RuziYz79udO9ZLq8+r2R4DICC
	 hxjEJr0yH99IqaBEkpDSenp0KLcVF+59ExE1R/uDMCOjZKQS03nr5UeSD6ff4n7Qu6
	 23jkQnMmfuuMPFJ+gwxpIeUNult16TaLKAkD/xCa0X0vO6+HGfViMeLG76I0WLMBOt
	 nJxq8cTJhLJqLk1kq3l6a3nWb822IrB7J1w0q4EfII+3I6uOXzlcCQTq1fEJeOd7c6
	 Bb5oZmJ3VCMoQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a283c44478so13925060e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 13:48:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+3niiMgXkjdBoZ7fr6vDKmY2LfyTHolTFmTFkPHG1migyCfAJUONapTssXHIbcWhiY/9EjN3bG04nh@vger.kernel.org
X-Gm-Message-State: AOJu0YxPpgAx00qvK6A2W5FhmWT2AmrP598aFBWQ5/lTTZrBDIvLZNGs
	7KJ1O02kVIwHlQlxwnrKJyOVQbB5BCMV7XcqW5IlF1+1eO262ngq2xpRmuDT1mL8Y4sQYRKqTLK
	sY25bNtKragGAvI+64D4grzXL6z/TuU8=
X-Received: by 2002:a05:6512:3981:b0:5a2:c4f1:2635 with SMTP id
 2adb3069b0e04-5a4172e307amr10148193e87.41.1777063698385; Fri, 24 Apr 2026
 13:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr> <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 22:48:07 +0200
X-Gmail-Original-Message-ID: <CAD++jL=O75u0r2ZaZSxNhTYByY38GDXvpsW8HyjW1f9gh2+KjA@mail.gmail.com>
X-Gm-Features: AQROBzB16qsj3GujL8b5ZQZQVOXOMFbhR3ha-RvGHxlKIhb-Pz_tIyFGs3LtbMQ
Message-ID: <CAD++jL=O75u0r2ZaZSxNhTYByY38GDXvpsW8HyjW1f9gh2+KjA@mail.gmail.com>
Subject: Re: [PATCH 6/8] ARM: dts: qcom: apq8064: Fix USB controller clocks
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 627B3463527
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-35517-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[21];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

On Tue, Apr 21, 2026 at 11:45=E2=80=AFAM Alexandre MINETTE via B4 Relay
<devnull+contact.alex-min.fr@kernel.org> wrote:

> From: Alexandre MINETTE <contact@alex-min.fr>
>
> The APQ8064 HS USB controller nodes describe the transceiver clock as
> "core", but the ChipIdea MSM glue expects "core" to be the controller
> fabric clock and "fs" to be the transceiver clock.
>
> This mismatch can leave the fabric clock disabled while the controller is
> accessed. Some boards may tolerate that if the clock is already enabled
> elsewhere, but it is not a correct description of the hardware.
>
> Describe the RPM Daytona fabric clock as "core", the AHB clock as
> "iface", and the transceiver clock as "fs" for all APQ8064 HS USB
> controllers. Without this, USB does not probe reliably on Samsung Galaxy
> S4 because the fabric clock remains disabled.
>
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

