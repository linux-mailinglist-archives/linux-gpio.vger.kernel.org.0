Return-Path: <linux-gpio+bounces-38131-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KHKTCMRFJ2rXuAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38131-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:44:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D2065B0B6
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:44:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GV5Su1Br;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38131-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38131-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAC1430166E4
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 22:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7803B42C0;
	Mon,  8 Jun 2026 22:43:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC0A3B388A
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:43:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780958637; cv=none; b=Qx5076memgOmiqq7iGiej5vr7kOqgiyR1VjdMnmU/aCotBR5ZeHTRohhth5TZpujpxi6gocBJS9H30pPDCjK2uo8ap3ONhDAXe0NGtNMCd7xluWfc5CvJVvoS85kPS38uYpoOjdv8FYFKtCReM0r/ySF2J0V110jTpLm1Tm7tSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780958637; c=relaxed/simple;
	bh=A0aMEuooSpehlxvLLcCYGZi3/rId/udlnvg3u80kiOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8HBQGL7ewvAFwDhpOZjVPcEcSIBlGgjRtWcWxVhky2xuDrnh5hl8mXSMRor8F6E4ojfHjyoonQUZiflyD9GtaGFoF2Z6qvWngy4XfsM7RC5/YVqFwgEaQGoW9a/okxmWrS5RKkD2wNdaieezb0ubxkJdCKNVbLzZ+2ambPgiKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GV5Su1Br; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008D61F00898
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780958636;
	bh=yO33fZb1LjugzRw+G0ggE1zSXDOM86JcqH727KoL53Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GV5Su1Br5SvCs/rJNXXZeLpyhUFI3jQikNovCcx5qQfodSUdXRHSVw7DWxNCJL3KT
	 Ou1iT5jrVoWXlUuZ2Gvf+gJ9/3gVWTc42TyvGOdXuAir8y1XTOQGaUMi6Cwxw5zqkj
	 MWv2oDZUFskzYtIx4Qk/BmlliyCwfAld4Us+jiDYSGykz5OxNPICZnBG6Mlqf+Ymzt
	 omLwRHUBR72YpNwsMTp6K0HaG5OxXpCoK7fb36r1AMVz4EqT4uHJMwXb5m10bBmQsW
	 wefup+Aa0hpns1Hue0lbWvYs8BdM1RjR6gbkmq6De1rCAuFKglyfGY74YQOGd1yaDG
	 +dYmx5GlgXleg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3965f215817so43660971fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 15:43:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8j8Ti86Ndq6Jvl9L0BKnK1xgA9N3KdwaXH21DL14jJJWCaoAWTLyP+rujhysevplKeRsGstnQi3ENl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3FotlCpjA4F6if3q/8TqK8H1zHkiMAjLwfHFoZ7kNGuH5yair
	svdnLxeVLY9Nu+YyXr381IPXN03pSpIb6lPZV5bLuxumjqjWKN2Tcw11MV5iaTo9S2GZY1Bl57J
	M+I5eD43KUmkOhGfMAAjK4QZHrx0N/6E=
X-Received: by 2002:a2e:a715:0:b0:396:b398:5990 with SMTP id
 38308e7fff4ca-396d0802544mr31409431fa.10.1780958634795; Mon, 08 Jun 2026
 15:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com> <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:43:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLnqCipTxkOhiwQhKFymOxu1HOTbHzLbNrGTOkCO33y8Vg@mail.gmail.com>
X-Gm-Features: AVVi8CdznhrC7lojiEVCZUJLtYjgr49qwHSYBFLmYEj8dqSmxJu9YBHItYZ4E9Y
Message-ID: <CAD++jLnqCipTxkOhiwQhKFymOxu1HOTbHzLbNrGTOkCO33y8Vg@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38131-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,redhat.com,gmail.com,oss.qualcomm.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71D2065B0B6

On Tue, Jun 2, 2026 at 5:22=E2=80=AFPM Taniya Das <taniya.das@oss.qualcomm.=
com> wrote:

> Add the gp_mn pin mux function to the TLMM pin controllers for the
> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
> divider clock output on a dedicated GPIO pin, allowing the clock signal
> to be routed externally.
>
> - QCS8300: gpio32
> - SA8775P: gpio35
> - SC7280:  gpio60
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

This looks all right and no-one is saying anything about it, should
I just apply this one patch to the pin control tree? It doesn't seem
to have any dependencies.

Yours,
Linus Walleij

