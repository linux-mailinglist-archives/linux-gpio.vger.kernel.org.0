Return-Path: <linux-gpio+bounces-35515-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PYtEZTW62lISAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35515-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 22:46:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD04B463499
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 22:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B67C301BA64
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 20:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E720E3FCB38;
	Fri, 24 Apr 2026 20:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zt1liQyH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FF53FBED2
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 20:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777063552; cv=none; b=SQ5g95676mNNfTp2RR14+oxQEJvtbbuLZtwSJoEWrDq4It1yaAVhQhKuXfoH225FQqUccBmrWrVnu1xDEFTSH/lHN/H3CaOTc4jE/+Gjw2aGcCxkokKM59m2MgTs/73TlJtRq21utJphg5zvOqfMGUFFoCqaA85ocbUTWy2HelI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777063552; c=relaxed/simple;
	bh=QQVPbAJe1D/rdWVbB8sLL4cm+7ydyjVeQVpTo63Bf8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pu68quoqTFy4LNb9Nev+zAEmi4ei3KMn4bgF4obhlR9ePi7ObEHkpoUtonBJD69zCA17J04UqHk27f5vZ34UsAiggxEMrIhIHO/0m4KJL7HOBdV0pZAM7wOadz8ExQ19qa3oKy/VtDpq1osqwQt01YZtOT+2/8b7X0F+EkTezk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zt1liQyH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DF3C2BCC9
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 20:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777063552;
	bh=QQVPbAJe1D/rdWVbB8sLL4cm+7ydyjVeQVpTo63Bf8Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zt1liQyHojBEDzgt/4Y58/4Uce4XcufB6/jvkWkLfjSg7du7b+DzcD9pM7igFAChV
	 u1ymyZL/X7H+cESfBujV8Ilr+0PnhuyPzwtGu+XKAhq8VimCjWeUb3jlgY5FrLw+8D
	 dz8QNb71x67yilXALKaZMLsxwdTWiLnBl5Lj37Bo3XMbS0ArYojF/XysRaX/Pf3mBo
	 R+ELy4AfVNscYmkCfIhY5fDEKvmdcUgl+EHczvVbAfrjj7JXUoou0tVDo2Tp4qQGuy
	 p3sOUq1I/57RxCV+dylRgjG94a/vkOpO7Vq4uLn5qz0ryr5t9a9C5oElEmT/BVSzxv
	 kbxAgLzSX3NxA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59dea72099eso8738070e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 13:45:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+WRbc6XcSlzV7oWOOUzG2Zbh+6jA1+Y7vSvyMNduFmORihoUk/a3B09BEf6BqtzDlkYW0F+X568KC3@vger.kernel.org
X-Gm-Message-State: AOJu0YzJt0Dn9Ex/ZsaOI4my8m7oDbTEb6CT1EItNa8HSDddI4J+DSRB
	NcZKOSGwGuYvb/UgVwfX8B/ywMomV11or+8Z5pxViYC0CRXQoC5ajU5SaNpnG/THcKP+VPnaSb0
	NOU33fy8LNYkKlzkO8ETZmo+M59EjIvI=
X-Received: by 2002:a05:6512:3190:b0:5a7:3c4a:cf24 with SMTP id
 2adb3069b0e04-5a73c4ad073mr697853e87.42.1777063550924; Fri, 24 Apr 2026
 13:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr> <20260421-mainline-send-v1-sending-v1-8-bcb0857724de@alex-min.fr>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-8-bcb0857724de@alex-min.fr>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 22:45:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLns8oZiT2f=xygyQpW7M4K8uK+1b69mnttVdyyFPvsZcg@mail.gmail.com>
X-Gm-Features: AQROBzBoXAy-C0CrQerj336vDfFiZhyjD7Ifx3DKS-loH9I1fUGk0cwOK9RXNKM
Message-ID: <CAD++jLns8oZiT2f=xygyQpW7M4K8uK+1b69mnttVdyyFPvsZcg@mail.gmail.com>
Subject: Re: [PATCH 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
	phone-devel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AD04B463499
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-35515-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

Hi Alexandre,

On Tue, Apr 21, 2026 at 11:45=E2=80=AFAM Alexandre MINETTE via B4 Relay
<devnull+contact.alex-min.fr@kernel.org> wrote:

> From: Alexandre MINETTE <contact@alex-min.fr>
>
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
>
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
>
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>

Which modem is in this phone?

I just briefly mentione the S4 in this message:
https://lore.kernel.org/phone-devel/CAD++jLmBxH1Zubh2avWrvMs4L0zv1NU7WEO3D8=
aeGiiVZo5AdQ@mail.gmail.com/T/#u

If this phone has one of the Ericsson CAIF modems it feels weird if
we add the DTS at the same time as we delete the modem support
code... (it can be resurrected easily of course)

Yours,
Linus Walleij

