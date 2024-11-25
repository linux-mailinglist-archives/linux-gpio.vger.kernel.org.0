Return-Path: <linux-gpio+bounces-13268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C839D8666
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 14:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F825286615
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 13:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B481AB528;
	Mon, 25 Nov 2024 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpGUPoDy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D72F1AA78E;
	Mon, 25 Nov 2024 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732541322; cv=none; b=AZCpxjL2KSGG4v4bSxXW+HX0obnt5e7/CvgbFKXyvmPL1zQNGkVHC0jL8a+lnJCmt5J+s1LLQFK2R6efJj5xkItU7SwAu6UeZxgWFkKvcQiRlDvn7w+UDdETA9Vc06hJqyENGhr/y8ROh88PZjEMeOjduhleGK4V9GNHj+G3hSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732541322; c=relaxed/simple;
	bh=NoZVCppL8F6xXg/rkssmXdlSEzoxZVEEPwLIm3+L6NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLtCcZkwzxCdBcqeqLP6YUZGj0/+zjTZMOTPMIZGDT5RiQMLbUEEE/ezjeaCaB2ctcg9y1Zwnq0jYVnQ8NWzKJEYNxvKT9yahIEw8RPCfZMVYvv5KelEDNL3c6r8ohDMefIiADRpJJyAYMU4eAUpOcRXiLevH7aR4Waam2t7Nw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpGUPoDy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A2AC4CECE;
	Mon, 25 Nov 2024 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732541322;
	bh=NoZVCppL8F6xXg/rkssmXdlSEzoxZVEEPwLIm3+L6NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpGUPoDy+lpjK8ovjXSc/xTMJcV/SY4/HKvoVZEEDnvvbJnNYIvocXaQWHC7cxWo5
	 YX9mLLmF1/LeyQ2yyfuh6BDUE70R7hsShSjVsGlkvB7fp0/oR2lyx5PQynjXUusnba
	 uijAWtWfKBwHhYBaKFpycH1jpWwHKBwGeDb6tma5XC5AuT8ZETsvTh5+tNXcqONUr9
	 mppQPAnFzNp3xrS5j3jhn5v+YONueox1fx2+IV1pRuHz7GNF+cY8NzJOJIvt4dIsOb
	 E16naW+VWwsEDo17U5VvRmf2NsACxEPK0VI13B5MtbJKZ7h0Gx3nNRjX4oxHGmeI/Z
	 JzKuaEIfZ31Ww==
Date: Mon, 25 Nov 2024 08:28:40 -0500
From: Sasha Levin <sashal@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] pin control changes for v6.13
Message-ID: <Z0R7iGP-0cQwmY7A@sashalap>
References: <CACRpkdZWqTOTzYYgD-wAps2Ygsh-D+nxaW76hrWSdTDZZKBA_w@mail.gmail.com>
 <Z0NaYhtZy89ObgmR@sashalap>
 <CACRpkdaZ=YvMSLYWUrmsjknk-gNV8o5v_y8sasRcxweyTSkKHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaZ=YvMSLYWUrmsjknk-gNV8o5v_y8sasRcxweyTSkKHQ@mail.gmail.com>

On Mon, Nov 25, 2024 at 09:48:59AM +0100, Linus Walleij wrote:
>On Sun, Nov 24, 2024 at 5:55 PM Sasha Levin <sashal@kernel.org> wrote:
>
>> I've just hit the issue you've described in this PR:
>(...)
>> Is effectively a revert of one of the commits that are part of this PR:
>>
>> >      pinctrl: aw9523: add missing mutex_destroy
>>
>> Would it make more sense to just re-do this PR without the offending
>> commit? I understand that this is a fairly small fixup, but I'm
>> concerned that this will just create confusion later on...
>
>I don't follow what you mean I should do. The offending commit is a
>fix and it is already upstream since -rc4.

Oh, there's something off in the PR itself: it lists "pinctrl: aw9523:
add missing mutex_destroy" as a commit that is included in this PR, but
really it's already upstream.

Sorry, I got confused by that.

>Torvalds could probably fix the issue by simply reverting
>393c554093c0c4cbc8e2f178d36df169016384da
>instead of applying the fixup though, it has the same textual and
>semantic effect. I just tested it and it works fine.
>
>^Torvalds: looks like revert on top is a better idea than fixups
>so we don't upset the stable maintainer scripts.

Yes, a revert would be nicer as it'll make sure we can easily get it to
older stable trees.

-- 
Thanks,
Sasha

