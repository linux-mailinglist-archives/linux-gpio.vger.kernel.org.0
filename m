Return-Path: <linux-gpio+bounces-30428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B520D10E3A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 08:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22A2730D599F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 07:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700593328FB;
	Mon, 12 Jan 2026 07:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+AGYuHi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7F6330B2B;
	Mon, 12 Jan 2026 07:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768203128; cv=none; b=tu+fNzWwPEBj23FBWnXfw5UgM10s5tYxfg68An/pr5c30/rxHT8h76b5CmNzAuuaXY0r2hUHIiXksRRA8Gkmnuy9oYZX2kkOlDjueiKd7+IwLfwoLYFBkcHDJPGsvMvfXlmqxFt9G0Jrjy5AnOJ4a18w6yc85B75npS8UkdU2wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768203128; c=relaxed/simple;
	bh=x9zUZcTbJ63fS+4P9YOXAvKk0aAAogf1Y9hTZ8aFPxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRjmTdTy4dAvfN4wEgnyt5s6gXUeaWcMvp7KYSffGhGAZHWL3k7Yqk/qLBoOBSXBzOM52xU97hCBtPWbwb/LWOi3lMmyILMX1je440yZbRnIElOMwWB8/WlHlCdVhlxP/fjQHXrj7dw2h5Vq0ASe80kRfHEGaEPOZEhLVXR8qHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+AGYuHi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F22C116D0;
	Mon, 12 Jan 2026 07:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768203127;
	bh=x9zUZcTbJ63fS+4P9YOXAvKk0aAAogf1Y9hTZ8aFPxE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N+AGYuHi0yU4tlRHAlboUD7yJLGpn2/bO7n4v8xeDMRmm7oTT+81o/Toulh5zux5M
	 LEMvQLpBvYLfJ9dPMjKCapJALqQxaZSkj8FKWU3iznQ+C3mBw4SjEfqv17++V+SivI
	 G2wcDD1NUuxyhBpLIXo/lT+x7Ms/t6Plb9rYWSjsP6SMoLidibLHBQjFxplrOlpZF9
	 MmeGx3izEy6wvW2/tBEInZv909T/gfh7hXcE4Yww/1i8Shr0DlJZlv84a6uHUc1uWV
	 qEKCTgkazAuZjMICBZxhEsPUcGlxRPGC6HRMzakkhxNYq84Uoxl0ks7P+gtrz37Zs3
	 Bpoc0QwuYGJ1g==
Message-ID: <a0199465-b488-4afe-8a42-4a082a780ed4@kernel.org>
Date: Mon, 12 Jan 2026 08:32:03 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: gpio-mmio: Add opencores GPIO
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux OpenRISC <linux-openrisc@vger.kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260109134409.2153333-1-shorne@gmail.com>
 <20260109134409.2153333-3-shorne@gmail.com>
 <20260111-amorphous-cow-of-stamina-6f2720@quoll> <aWPRHHhdjGE2f8aT@antec>
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
In-Reply-To: <aWPRHHhdjGE2f8aT@antec>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/01/2026 17:34, Stafford Horne wrote:
> On Sun, Jan 11, 2026 at 11:20:38AM +0100, Krzysztof Kozlowski wrote:
>> On Fri, Jan 09, 2026 at 01:43:53PM +0000, Stafford Horne wrote:
>>> Add a device tree binding for the opencores GPIO controller.
>>>
>>> On FPGA Development boards with GPIOs the OpenRISC architecture uses the
>>> opencores gpio verilog rtl which is compatible with the MMIO GPIO driver.
>>>
>>> Link: https://opencores.org/projects/gpio
>>> Signed-off-by: Stafford Horne <shorne@gmail.com>
>>> ---
>>> Since v2:
>>>  - Fixup patch to simply add opencores,gpio and add an example.
>>> Since v1:
>>>  - Fix schema to actually match the example.
>>>
>>>  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>
>> This does not even apply now. Your previous version was applied almost
>> one month before and you WERE notified about it.
>>
>> Why did you ignore Bartosz's reply?
> 
> Hi Krzysztof,
> 
> Sorry for the confusion, we discussed [1] this patch in the last Series with Geert
> and Linus W. We decided to Fixup (replace) the original patch with this and a
> patch to the GPIO MMIO driver instead.  I pointed it out in the cover letter but
> it may have not been clear.
> 
> I will reply to Bartosz's original mail too so he can understand the intent.

But you did not send any fixup, anything which would change what was
applied almost one month ago!

Best regards,
Krzysztof

