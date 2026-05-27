Return-Path: <linux-gpio+bounces-37559-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FLjIfmmFmoOoAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37559-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 10:10:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8F85E0DE8
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 10:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CE66300A67B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 08:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92263CC327;
	Wed, 27 May 2026 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpAw2DME"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971393B7768
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869427; cv=none; b=ZDCdV8LvA8z4dU2LJ8W/e4jz/O7gbr94gbT45/glxqLDWcoUBt49QaLLSFIlDGCx+7/Pm3pcq8YMKFVTF+72pxOPoUGoFIw9cYcZrCyOB0sxviEn/R7h2uKsGVN74SPQWgvejJA/q9ez7pIwROQLmGmnEY7H/so5TDvBTUoeWcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869427; c=relaxed/simple;
	bh=bVNvsh4K64Df3EqFkFA67hocqWcXkdqSM3MzF8qjXiA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DP0kjZxmtaMCgpkqBr2uYPfgk51PU5XT9sHsentkdNZ9uGYqMuIcf5uEULdcF+8aBLRl38/+8syBB3X/2jCJ9Ww5d91mWL3NEI7zILW3kEAAhOyoTwBLQvzhjyAzCx6s4adtMdxZVgGLsDkq5+sZcSXFYBHvdzvA7TY08DaGI2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpAw2DME; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489511F00A3C
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779869426;
	bh=KRN67tkQlkMDZKLT9iKAVE1JzAihnwk5W2CB0m5etpY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MpAw2DMEpWcNnfHEOmHMYcGGtoq4TEO43kGDNyXh8cmnRnHnDzJZLdk+qIXbwLGrf
	 0MsA943j+nCZnekfxrNm9loBcu2sd6XfRhkNO0N3m6+UMvFcWHOMCGjQOdaY9pMBth
	 MW6gMzqMGBGzoVnjvSXwbRtsqsa88K0SzIRoYG4vL3sXoJCSjs5/nGtSziqvCD28xK
	 QQTp49rXK9xamDit2QTC2tGc59W3izYgO8Fjn8auwqDBSNgXFEuXuXCH74z6dYaHFB
	 iAv/FnjyDB533CA85u36IudlAQWYaZFS/SnDDKSZBEEvTIC4xrWOViSyCPAje+XZk6
	 I3OPXbo5EYtVg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso102291251fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 01:10:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/g/trqtom7vyqekwnDrf7MTOUc4+/EEvNVHsPsf5t3MF0UV+C+fsu7rkxXUBY/W6q/y9tLDyW0hVXE@vger.kernel.org
X-Gm-Message-State: AOJu0YzKGZZxqkW5t5FQF7e/W8VqB9qvMVVrHkXffopcOIm9nOIVz1hH
	9lAe7Sw4JHjXARVQ2IItt4gVqAau47zo7mkHB7g5mKfr388r71UnAi7n1Meizj9O1XdHchHpFMc
	af6rpCfP5NLuk/1B4v94OP1HApqqPNY/i0BIq/iRlvg==
X-Received: by 2002:a05:651c:1144:b0:393:c6b5:9930 with SMTP id
 38308e7fff4ca-395d89f8bc0mr66274191fa.27.1779869424983; Wed, 27 May 2026
 01:10:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 04:10:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 04:10:23 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260526171050.12785-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
 <20260526171050.12785-1-scardracs@disroot.org>
Date: Wed, 27 May 2026 04:10:23 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mdid6eE0_Vy4WBBz5OQuNg6fOmBGjjGHpWW_mXrcSMA9w@mail.gmail.com>
X-Gm-Features: AVHnY4IFLgMQGuRInLadJCLOEP27q2rYiq6VMJnNMgrrC9fDtHdryVv1ax6veT4
Message-ID: <CAMRc=Mdid6eE0_Vy4WBBz5OQuNg6fOmBGjjGHpWW_mXrcSMA9w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: rockchip: fix resource leaks and teardown bugs
To: Marco Scardovi <scardracs@disroot.org>
Cc: heiko@sntech.de, linusw@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37559-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B8F85E0DE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 19:02:44 +0200, Marco Scardovi <scardracs@disroot.org> said:
> Hi Bartosz,
> thank you for the review on the first version of this series.
>
> TL;DR: There's no clock-names property in the DTBs for the GPIO banks,
>        and they don't expose a separate debounce clock in hardware.
>
> Regarding your question: existing DTBs currently do not provide clock-names
> for these GPIO nodes and instead rely on positional clock ordering.
>
> While we could extend the binding to optionally support clock-names going
> forward, the driver still needs to remain compatible with existing DTBs, so
> it cannot rely on name-based lookup here.
>
> For this reason, keeping the index-based of_clk_get(..., 1) lookup together
> with devm_add_action_or_reset() for cleanup seemed like the safest option.
>
> A good example can be gpio1 in rk3399-base.dtsi, where the clocks property
> is defined as:
>
>   clocks = <&pmucru PCLK_GPIO1_PMU>;
>
> If we switched to name-based lookup via devm_clk_get(dev, "db"), it would
> fail for existing DTBs because they do not define the corresponding
> clock-names property.
>
> Additionally, PMU banks such as gpio1 do not expose a separate debounce
> clock in hardware, so there would not be a matching entry anyway.
>
> Therefore, using of_clk_get(..., 1) is currently the only approach that
> preserves compatibility with existing DTBs while avoiding regressions.
>

I see. Can you please reverse the order of the patches? The fix should go into
v7.1 and stable branches, patch 1/2 is a new feature so it'll go into v7.2.

Bart

