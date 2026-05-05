Return-Path: <linux-gpio+bounces-36176-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO0mJBDI+WlhEAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36176-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:36:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0E34CB7F6
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A75A3015723
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 10:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3A5402BB1;
	Tue,  5 May 2026 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcs+MsDp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B91B401A32
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777977357; cv=none; b=uFRficIf8gyFkWU7ifA1S5dSJF3C3xikauMiV9Y2H7Md3W7C3jS3FQtBRTWiySheamk2B3H1r1QiB6uwJ1cZmWC1NxeGarTDmaxB5KPX8NyfPR8mQzSYj4GhYAtqvf7me4ribTycaAcETaLnX88WxbOuxJCmPhcEPVnPIDLK+qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777977357; c=relaxed/simple;
	bh=Sry2ktgGdcsR64ZwxTmIoQXh4KYNJajghvrHVmfRXmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucXmsMnrQeu9YIItr2zDRQulBUWVXxyOWcR1/qtaVURjjskwvmuSiz8qxWihofQPyqytppXzITJ7Kv62nMmIHFolpl44JolnMDLKElK4Irw2FGOtUpQnmkzhyBQ3Hee/3HnqPze911sl1vAbDQMEiFsdJtPJaWV6m74pzr5XRnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcs+MsDp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA76AC2BCFB
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 10:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777977357;
	bh=Sry2ktgGdcsR64ZwxTmIoQXh4KYNJajghvrHVmfRXmM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bcs+MsDp+Ixm++6Da/isHYjDFJcaiCIQNXrHqiwHg4/RX4B+IfFtbIKl7x7idmXla
	 W/47zC0N0oOZRwpX11u14YnEVeBEm3TpJco2FOpbp0Onwj89crfN9/BL4AtdSlGgBC
	 S83a3gStX2xWx75Z5ytmARoHPfr8n5JaBK4xpJeOzA3gstkI2JIPwn2XOx14b5XpWJ
	 PC3zC47nGmNUv+ZUqCmyk72SpR5FaGu2LueTlqk1KHUKHn4aCAGg8MR5hIClepu/iz
	 MwSEqLuoMNyL/brTnAtRy6OorYh4swPNoAJiqZfvdqOgdis8vuD8n5nLuMlwRopvwZ
	 IUt2agwBRh/1w==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e97e73234so49167321fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 03:35:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/MPXoKTM+rX9JkHkzk6wKGiv/0sOM+Z97nrh6D1B6dd7PYb0+OTwXcXoePpacwpkUXFdlW2S5IAqVx@vger.kernel.org
X-Gm-Message-State: AOJu0YwO4YVn/HSYlIk05J5f8UX1gymAcfFT8am80uSsU56vMR/Ag4JM
	gPzKK5h3OUZ4yJZhm1FpjV328WGHPYkAKsKOomug1A+vsPaERL7GGgQ32jvr45ocxAoxmhiKwoM
	3bCwL0U7I93ebm3LAchNl73U5pEt5UMQ=
X-Received: by 2002:a05:651c:4408:20b0:393:7ab3:6d50 with SMTP id
 38308e7fff4ca-3937ab36e35mr29580461fa.6.1777977355591; Tue, 05 May 2026
 03:35:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 12:35:44 +0200
X-Gmail-Original-Message-ID: <CAD++jL==mAQAmfQDcnasnjgXnTsN46nFBgFuHOz_1Tf-k-3BpQ@mail.gmail.com>
X-Gm-Features: AVHnY4J6LQT4hNxO1MLWM78U1AQG8KUhna4m7qci3-9x_WiKfvEo4HSyfMeATtg
Message-ID: <CAD++jL==mAQAmfQDcnasnjgXnTsN46nFBgFuHOz_1Tf-k-3BpQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Add LPASS LPI pin controller support for SM6350
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2F0E34CB7F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36176-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Thu, Apr 30, 2026 at 9:10=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:

> Introduce support for the LPASS LPI pin controller for the Qualcomm
> SM6350 SoC, by adding the dt-bindings, driver, dts bits and enabling it
> in the arm64 defconfig.
>
> The custom slew offset for gpio14 is described as
> "qcom,lpi-slew-base-tbl" in the downstream dts[0]. I've tried to find
> some reasonable solution to have this handled correctly in the patches
> here, but suggestions are welcome how to improve the situation. There's
> of course several ways to implement a solution for this.
>
> [0] https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-e=
xtra/devicetree/+/refs/heads/kernel/13/fp4/qcom/lagoon-lpi.dtsi#25
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Fixed up Kconfig text and applied patches 1, 2 and 3 to the pinctrl tree.

Please funnel patches 4 & 5 through the SoC tree (Bjorn Andersson,
I think.)

Yours,
Linus Walleij

