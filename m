Return-Path: <linux-gpio+bounces-7737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F68918542
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 17:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A84828EB5B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 15:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBEE1891C9;
	Wed, 26 Jun 2024 15:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8iAZ1xD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32B71891AD;
	Wed, 26 Jun 2024 15:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414432; cv=none; b=G4RldQaJtA1atRssTH+Wimq2K6rTLtjd5vv94QfRnecyFRotwyBYltAsLv9oviN8ZkiNZ+kAvqzPLXTxnhnfCoDQyJn3rn8gzNkHGZUT2DXdHTqw3ONAB4WEllw5bnetLgr+nOMfqqch86d4T1ZBVpxrYXojrmU3uP2PbH2LFeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414432; c=relaxed/simple;
	bh=txBxUp3CXVqRccQ5CJNg98fgwoZlgkaF+seGvYyGHHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgTdlIfFk1mdgnobZ/oR7oVGdHkVATtpdasP0j/TkkbfEIhz2i5ygAkq/lx2hNn9eLJtf3PlSsF/DKIruQgKlpQ2XBG/h7ohVtWstlj5gpcy//AIdVDdnykIXpryOuWkRrvnzt13nazzn5gzFBR4WjDUdKz7SxxSNVw3PkmbPII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8iAZ1xD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E2DC116B1;
	Wed, 26 Jun 2024 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719414432;
	bh=txBxUp3CXVqRccQ5CJNg98fgwoZlgkaF+seGvYyGHHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h8iAZ1xDYFxTgKR5bySkBKR+B8TZXig/qQUFHgxl74tUSbOft+2HX+MPHICyJUU8e
	 HI7iHrlvr2SD7JjR+QlIaalGbcejZ3mkNxcwf+cnLAR+kahCjCpAsrvAAStT1XyaCe
	 9Zg/lQ6AOUMFr3ha9AvWCHY0DfJV9GqfP8uks/XwkqDjvLpHh7UUVyHDmiCmGQV41j
	 iZw7vOt8JwjJFgGoG9QUHAnMC2oO8NOjgQP0XPHfXHP+YRhV21JH5gisysdsbIyGu5
	 kxvvVdVB9RyYHvkukyCRTwfrd0qtmg7fzCkCqdAWc2sYTR8lpBpkRHX5I5uOFDXHQK
	 +Em6Zass2Azsw==
Message-ID: <65d76651-1956-412f-911a-046f0303a16a@kernel.org>
Date: Wed, 26 Jun 2024 17:07:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] pinctrl: qcom: add sm4250 lpi pinctrl
To: Linus Walleij <linus.walleij@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
 <CACRpkdZyupZmV+e=L0KR8ospH9P=wdUrMFvBnGXyfhLhW3-=PQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <CACRpkdZyupZmV+e=L0KR8ospH9P=wdUrMFvBnGXyfhLhW3-=PQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 26.06.2024 12:04 PM, Linus Walleij wrote:
> On Sat, Jun 22, 2024 at 6:49 PM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
> 
>> Add support for sm4250 lpi pinctrl.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> No major protests against v4 so patches applied!

This was never sent to me..

We already have a driver for this SoC. 4250 and 6115 are the same
(except the former is frequency-capped): pinctrl-sm6115-lpass-lpi.c

Konrad

