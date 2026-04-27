Return-Path: <linux-gpio+bounces-35587-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGKxBGpx72n6BQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35587-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:23:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6782947447A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 16:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A562A306DA71
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75E53D3CED;
	Mon, 27 Apr 2026 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecOilbna"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B8336998C
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299570; cv=none; b=sofb4CY6j/RKkhFUeueVQw0/soyU2ZQ11yrPRoRBo8KHkoo/XaS3ktByLOKLCxZ9zt5TN6HD/WLlPSdi++7gvQwXMMJtao1uXRf14ahgdurHGbGuaFN8a/IqAcM8uO6Pey5Rt82//5iuM/S+7ix2mMlgzik/lrX/bzk7u96QJdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299570; c=relaxed/simple;
	bh=TUSa+V6fI08d4nOKFeekuHXah98vfOm5LhjsV8D2a0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=it6frv9YUFFuHoPbJWOs2Onlvzihy5ddmiiZYz2UdGXuVqdyAQ6/G0A464ToO2/Ru2pB+ztKvhj+3rAJUClkd0pGKx6nE+iQSMeaNEfAzGaLwBISPKIA/Mcrl2wakvrKXiMlx/LeNrh9+lliZAaHEc00DN75F25zwdMDipQ1rz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecOilbna; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C60AC2BCF5
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299570;
	bh=TUSa+V6fI08d4nOKFeekuHXah98vfOm5LhjsV8D2a0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ecOilbna6gZoiccrPJGCjKvke36KFifFnL6pCaXDfptTLEWOhziexCxQKFJg8iZW7
	 JiMB0yOZx8T9AWpRRchtAH2XuQUKB4rBIIk92Tq6rGfK7uc4rZgXPsUD2zkRmoNBvj
	 Jmv7UH0IEB31VW2N66xdHaxxLFlA2azJiypASLwqlm+PRpDiOmvG0SawmA+3ITDVM9
	 sIveHbq1BuJfyk8BYIli0o5hKX6kpOcZwycXviyHCdYl136uwI6MrDW6HNdi8e9XX6
	 XBPE9qNhD/NWGq8GeUgbNqh5sDYFKDvBg4c47SScDWcM3VmUEydBPTKZgkyvE96rj7
	 gI8TlCpCqd19w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38e7d984096so112608581fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 07:19:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8uCMna1vP1iVZOh8hlB4HKNAuzEyIkxBZWkU8lwvW36TkkMFW6xz0CAE6oYGV/zsVLNlhKs6ZprtCY@vger.kernel.org
X-Gm-Message-State: AOJu0YzmJbkqk9sx9Mi0bfcSaqGfYxkq3ZYipnuGR/5ek9NpQ5OPQCsI
	2tKK7NxSp3Z6cdlq+8euW4ElDeY+/bSoJroB+HwiVY5Fb/SwfHy9PiY1xG42I2VAGGf8syU7vhT
	ROYpsJ5irwTxcCt7r4URKZE2jSEeS67h4M6MPCrToQg==
X-Received: by 2002:a05:6512:3e18:b0:5a4:157:5342 with SMTP id
 2adb3069b0e04-5a4172eeb07mr13066652e87.39.1777299569068; Mon, 27 Apr 2026
 07:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com>
 <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com> <ae9usgOf-KtgEJ4q@baldur>
In-Reply-To: <ae9usgOf-KtgEJ4q@baldur>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 27 Apr 2026 16:19:16 +0200
X-Gmail-Original-Message-ID: <CAMRc=MedyMb0jCjNtp_Jy-05eHuaZ_gLbLWAQVFuxBk4wxAUPA@mail.gmail.com>
X-Gm-Features: AVHnY4KLKvQTIww_LmXI9MwhW94zXNui82mwS-N0sdDW_fPy6iQj1PtiDTKMtIA
Message-ID: <CAMRc=MedyMb0jCjNtp_Jy-05eHuaZ_gLbLWAQVFuxBk4wxAUPA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the TLMM driver for the Nord platforms
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6782947447A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35587-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,arndb.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 4:17=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Mon, Apr 27, 2026 at 04:00:30PM +0200, Bartosz Golaszewski wrote:
> > diff --git a/drivers/pinctrl/qcom/pinctrl-nord.c b/drivers/pinctrl/qcom=
/pinctrl-nord.c
> [..]
> > +enum nord_functions {
> > +     msm_mux_gpio,
> > +     msm_mux_aoss_cti,
> > +     msm_mux_atest_char0,
> > +     msm_mux_atest_char1,
> > +     msm_mux_atest_char2,
> > +     msm_mux_atest_char3,
> > +     msm_mux_atest_char_start,
> > +     msm_mux_atest_usb20,
> > +     msm_mux_atest_usb21,
> > +     msm_mux_aud_intfc0_clk,
> > +     msm_mux_aud_intfc0_data0,
> > +     msm_mux_aud_intfc0_data1,
> > +     msm_mux_aud_intfc0_data2,
> > +     msm_mux_aud_intfc0_data3,
> > +     msm_mux_aud_intfc0_data4,
> > +     msm_mux_aud_intfc0_data5,
> > +     msm_mux_aud_intfc0_data6,
> > +     msm_mux_aud_intfc0_data7,
> > +     msm_mux_aud_intfc0_ws,
> > +     msm_mux_aud_intfc10_clk,
> > +     msm_mux_aud_intfc10_data0,
> > +     msm_mux_aud_intfc10_data1,
> > +     msm_mux_aud_intfc10_ws,
> > +     msm_mux_aud_intfc1_clk,
> > +     msm_mux_aud_intfc1_data0,
> > +     msm_mux_aud_intfc1_data1,
> > +     msm_mux_aud_intfc1_data2,
> > +     msm_mux_aud_intfc1_data3,
> > +     msm_mux_aud_intfc1_data4,
> > +     msm_mux_aud_intfc1_data5,
> > +     msm_mux_aud_intfc1_data6,
> > +     msm_mux_aud_intfc1_data7,
>
> Is there any reason to keep these 8 "data" lanes as separate pingroups?
>

The answer here and elsewhere is: no. I just didn't have other states
in DTS to visualize the resulting nodes and it didn't occur to me to
update other functions as well. I'll do it in v3.

Bart

