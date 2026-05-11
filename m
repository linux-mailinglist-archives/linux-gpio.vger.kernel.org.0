Return-Path: <linux-gpio+bounces-36573-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCdSAPjQAWryjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36573-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:52:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D1B50E402
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 371273004F45
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B8C39D6E2;
	Mon, 11 May 2026 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCudluW9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA34239E6C6
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503461; cv=none; b=Twf7FceIDv4vGo5uEQDM9p12bpygvsaUFavEPPYB0z+7I9p68vo0NOPWrwR3dgE6GJ3NFfUTrsirfbNwsbEq1Xrgu3iTviijEKcGrQ4fRncd4geGsOnPUFzs+zHxJ1267aJIbfdp7HcBjajzfSfCmJ/ae8jFjuznNe5ofag7WQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503461; c=relaxed/simple;
	bh=xLVeg7IioqABanTkoEkXtvtgMWgQuVRYWFWdL+wNKdA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAnE+0FcwXkEAjSB4T48yFcT/XWILcuOirkdjBs3+ZI56orrFgishwfGrQyw0QrctGlyKwK18xDDrHIZiB3QZJkzR16wBTna0DekQvqaQdnAvwa4dHww958jj0G8UMyJCq19EKLHSZhK4HwPezScCdp3Wwn+KNXEXtAkN07C10A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCudluW9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD1AC2BCF7
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778503460;
	bh=xLVeg7IioqABanTkoEkXtvtgMWgQuVRYWFWdL+wNKdA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=MCudluW9QVbWzqkYyvLc/RcEIvgy2eJlPNOtrOqWy+x8B3u+WjmdWdFr+Uj2IUWZl
	 /eqiOTn2UlflEBgrYwAvKjagUJwN5V9WSww8iv+Pc0BFZGroxR1FluorghAQw7/0kc
	 9VAgbibEVTsJOtBMoZgSWrOZlbzyjhMjEqoog4k9PjUh/h0TBpzrij15wyOEWLjJiH
	 G5yq4vSOqkyGGQWq/ovAzRxj0ffV2Fa/EEuqwuGAeXKLqaCsEXTPeP4LRtLB2OaKKx
	 qKQ7MClI8WhORLAkd5C6c1lfJQMgdC870Nlw1TJlg+vxw/IRAOZUNmOzUmOQ7GAJKU
	 J6qWuILq+g3ww==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a525aedb24so4223136e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 05:44:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/3qQ6mCLO1US4lOeTse9U4Szkm+xDkC4F4Blo8SjRY5P5DAoW3zJjeE214Y+tKuIUQvzYD124XdMq7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2UabRI0o4yu2XdD2WLO+8zSSpFkjCABxn3iEFgC62946+7Go0
	G6EeR6sO/tU+Ke7vTs9lWcbhzeO6XguxDZahSz+t++0SvQRnoWhaQt0f5ysB8llt82Hnk+Dy1JO
	wuA9lru4WAC5cTqaS0asawlK2RK8O3gFpDAN49mKSUA==
X-Received: by 2002:a05:6512:3b9d:b0:5a3:ecf7:71c0 with SMTP id
 2adb3069b0e04-5a887ada530mr6970287e87.5.1778503459349; Mon, 11 May 2026
 05:44:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 05:44:17 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 05:44:17 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <DIFUQX289BWC.1BA30N8GASOKD@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
 <177850274681.64672.5290926520944173270.b4-ty@oss.qualcomm.com> <DIFUQX289BWC.1BA30N8GASOKD@kernel.org>
Date: Mon, 11 May 2026 05:44:17 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md34fowdx+HTsPTP9ByqRHRaLTcTUwg3DCC1STbLZp8tQ@mail.gmail.com>
X-Gm-Features: AVHnY4ICK_aV_stJX9MOpEI_KjlBgoAxsvun9JGGKfyUPkFk0A147vzmFBEXYPU
Message-ID: <CAMRc=Md34fowdx+HTsPTP9ByqRHRaLTcTUwg3DCC1STbLZp8tQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Improvement spotted during patch review.
To: Michael Walle <mwalle@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alex Elder <elder@riscstar.com>, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 57D1B50E402
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36573-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, 11 May 2026 14:39:03 +0200, Michael Walle <mwalle@kernel.org> said:
> Hi,
>
> On Mon May 11, 2026 at 2:32 PM CEST, Bartosz Golaszewski wrote:
>>
>> On Fri, 08 May 2026 14:51:25 +0200, Linus Walleij wrote:
>>> Support sparse unidirectional GPIO lines.
>>>
>>> To be used in a forthcoming submission.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [1/2] gpio: regmap: Support sparsed fixed direction
>>       https://git.kernel.org/brgl/c/ae99219270a3d85ec38eee9458829bd45c11aeec
>> [2/2] gpio: regmap: Don't set a fixed direction line
>>       https://git.kernel.org/brgl/c/c3566b4a08707587fd52342f53cda1d7ee2607ca
>>
>
> Mh, my review comment [1] made it through, didn't it?
>
> -michael
>
> [1] https://lore.kernel.org/linux-gpio/DIFNX8HLL7X3.JGSENU7W32X4@kernel.org/
>

I missed it, sorry. I'll back these out for now and wait for Linus' respin.

Bart

