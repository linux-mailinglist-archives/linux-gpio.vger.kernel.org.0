Return-Path: <linux-gpio+bounces-25148-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7FDB3A96C
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 20:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 014B7A02611
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 18:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BC527056E;
	Thu, 28 Aug 2025 18:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ho5N+PNB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED185270552;
	Thu, 28 Aug 2025 18:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756404156; cv=none; b=JMLTLP0M33q/1DEuxGOvgw3JZQkTc/I5hYuEixxUkg4/pSiUTwiyawXi3pROsVLCkvFIX7y78tbCfPzmgdWoByXhGhfOWDwxPcSdnD+P0cQXlmzaqvH8r2OfwGBLehqo1qvgSMPLEVXcrmgPx3UKe57notbrsBLBAPZcYLc/F68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756404156; c=relaxed/simple;
	bh=pG9/FbDbrj9tE6UmRGcNSlvTz0TPuSETudqBwaA4mAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OaGf3utWvn5Mxb6jWKMGVDBslTz2uKPJqMIAkC39AQPkKK9GqVkG2nxfLooo5ILJ4CjHvlAd0HM/niaY4E7tG/HVevI8T5uHnDcyFaxy+3E6fegP8yH58x9zgiAecD0BG7lSWPVm/ejO571AGP1nSLQM7Vj/e8dH+fnBdTdOk2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ho5N+PNB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140A3C4CEEB;
	Thu, 28 Aug 2025 18:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756404155;
	bh=pG9/FbDbrj9tE6UmRGcNSlvTz0TPuSETudqBwaA4mAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ho5N+PNBSUrp8JQvF4YnSTTl+JED0/zXNYQ3CqFXQQf4x7m0LiTHcs+9YBcz+8RuM
	 bRWPlDrjHU+MzF7hHhzZCRpeRj4AK8rl8J3lo5FB3RPChSBwgVxMmtG/AcLhOvgWop
	 m03TUKTepSt3yDnO6+l5E8qo8tKIPqXnHHMl994xzGoYalJobsi24v2QfqYX6jMkZL
	 +Vh+vSHtIXLiQeFbmpRlMvQ4OEDfDj7+YIYkip1n5zeZVNYwTXRgEhn6/TXX4Ha+P9
	 xTNzcz7XecGHzbkzxsmcSxDInxUX6YlRixrUdu8iPLfdiIIO/MBuF4MJLsi8NOcJaE
	 ex34BGTGMPU3Q==
Message-ID: <67e58bda-3cac-4689-831a-4e4116a0e19b@kernel.org>
Date: Thu, 28 Aug 2025 20:02:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] pinctrl: cix: Add pin-controller support for sky1
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Gary Yang <gary.yang@cixtech.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-2-gary.yang@cixtech.com>
 <d5c85ba7-77ec-47f4-8ba1-39199e96da11@kernel.org>
 <CACRpkdYXy9ZgbAZKUdquxdp0X0m5AHT82K74Ex-ZAyEx=Uwi1w@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <CACRpkdYXy9ZgbAZKUdquxdp0X0m5AHT82K74Ex-ZAyEx=Uwi1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2025 19:51, Linus Walleij wrote:
> On Wed, Aug 27, 2025 at 11:07 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 27/08/2025 04:42, Gary Yang wrote:
> 
>>> +     pinctrl_provide_dummies();
>>> +     dev_info(&pdev->dev, "initialized SKY1 pinctrl driver\n");
>>
>>
>> No, please drop. Drivers should be silent on success.
> 
> I usually think this is a matter of taste.

It's actually coding style:
https://elixir.bootlin.com/linux/v6.15-rc1/source/Documentation/process/coding-style.rst#L913

https://elixir.bootlin.com/linux/v6.15-rc1/source/Documentation/process/debugging/driver_development_debugging_guide.rst#L79

https://lore.kernel.org/all/20191210143706.3928480-6-gregkh@linuxfoundation.org/

> 
> I suppose the reason why a lot of drivers have some "hello world" message
> is that missing probe calls is sometimes an issue.
> 
> If you mistakenly disable the driver in Kconfig (or due to other Kconfig
> changes that just happen ...), how do you know from the dmesg
> what error you made, when comparing it to a successful boot. There
> are no *error* messages from the driver either, just the same silence as
> when it's enabled. With pinctrl, random completely unrelated stuff just
> stops working.
> 
> If you see that the "hello world" from that driver is missing, you know it
> isn't probing, instead of finding it out after combing through the .config
> for the third time.

Any tests for driver success should be checking in sysfs, not in dmesg.
Most of platforms have smaller or bigger tests for that.

> 
> But I know a lot of people are dmesg minimalists, because it's just too
> much information and they just want errors there. It makes sense in a
> way too.
> 
> So as subsystem maintainer I have no hard opinion on it.

Best regards,
Krzysztof

