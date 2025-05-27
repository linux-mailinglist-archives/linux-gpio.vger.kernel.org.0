Return-Path: <linux-gpio+bounces-20606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE49AC5A10
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 20:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05FBA1BA6B9B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 18:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB5F27FB10;
	Tue, 27 May 2025 18:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="njDq0DCx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A111F2C58
	for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 18:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748370809; cv=none; b=tFa0QS/E058tKVjJaCC2iJqlu8pIyjcD4cntfbUFuTTN2LAJSmYJosDj7nmIlVljv51yaz7QtBxtw4K2ofF5F8webz6YOTCO6c5sqVf8Pq6LeDTrtgyfsligJpLVH4zUNR1oDbZyzqz2N17pIZBqSghWpnrjMDPRg2Zz8RdKzSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748370809; c=relaxed/simple;
	bh=L2iE548AIHzZ8pItsHBp1mDshCcc2V1kn9eVKbCMQC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkQMNeAYfLwhtF1q6O423pZJEO6k8Xww+Osfb2096v4KUG5wu06Sf5EycKiwjkCoYmHf8G202rLledhUsqZUY1n7NHcWPcAMPZzd/uB6WISyYwCc3CI+Jw69vy/j/UQgqZD0YPZpNPnG21D9LV7kWAc1t1zHWYPUwyvPBqtsPmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=njDq0DCx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60472d90787so501796a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2025 11:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748370805; x=1748975605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=72YEn2Q0Dpja16kxp7P37Pj+KBEUoWoQIQbFc6yNBwA=;
        b=njDq0DCxEJi2+x3KePk7j8ppwJEANU5f4ZN2xezJk9GIxZ0ByBR5GrV6ZTFSu8VPJH
         jfNw2f0Wwf6ZHlbFrciID2en0IWAIHOIZxjnG9up1k2HTwpBVBjYVGzRYJJf7ewrW+6D
         N07Hzt+rbnoiy1a0b1z798+lwXg5MMBuguSxclcQJndxEDvcDu7r/qNXBSm+gOeeYbET
         8xXUS4N4iKj8wlXoaFhBgcS+FohzVLgoF7cPdg1W73paO1vMr0w5e2g6KkKlQ+XUYqHY
         qtuNBhJuDmIT+RdXzGU1cBwk3ZowBaesLdvLqg4ZlIFPSA8pNf2ym2GTAkX9JLNB0xuB
         Ux0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748370805; x=1748975605;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72YEn2Q0Dpja16kxp7P37Pj+KBEUoWoQIQbFc6yNBwA=;
        b=R7QP6lOKafxy75uukxp8vvuSrmKzHFMtSwAwuca5ff4VY0CaX4TaY+Pbxxq7NJ8ELx
         c+BIsIy2bl0/Ja7I7YBiXamQpntEs/aW4hFwbxqv0uGCfEyK9JA0GINUpfKhWgjZXlVk
         +QccT/9L+c2Il/rgBn/pdMJpMhKLN6T22I9rDaLiIbT3tKfYd33FGprvvl+3Er11uf82
         +TTlWJwpuvn5KVuSfR4gnoXKzbHV8GXd86ssPeRoR5cZqEzY0r1kTeu41ObuhR7CC6hL
         Y7yJRHKO3tE7GLjq51ulHTkQFd69bX3HpYcdUITaknMzAk0DGzV5aYQaLv305ysKgvNF
         Lrfg==
X-Forwarded-Encrypted: i=1; AJvYcCWHLDTfbUFtuMeIqODTcw/zGxBnA+34rQ/2PjcyBgOCnAeelxQnzh83uMf3rN0m6zNHURi+ckDjgApl@vger.kernel.org
X-Gm-Message-State: AOJu0YxJEnAkedqXVSG5B6f8KDxODvR2wXbZWfs4uFLgt/+yJPyQBJmL
	vCsIoJI+WLHX2VOXWavaD5AE7G80PEKahoJ91yWiVS0ZtYw8EYA26qTf5DLOetdKfpo=
X-Gm-Gg: ASbGncvuYn4n9wJVY0blOpXASdcku9cqzjOsJVXD0+j95JN6FC9Sa9EgpSGjVgF9GkM
	SoGphcTL9gYbFTBHKCeFCzNKBB34bJcDHAl9LZmETays6QstqnfS0YT87BWm/hx1xVW0fssm76k
	8/VWLhQUNYMxCmeuBOk+NrajGS8XTwkBD/tIX0WNIypqL2iUymKrsaiJttNDeHD1Az8H9nQQ+hA
	OYowtMZpcO6+44VesOk5qnWu9bnSd4SC1RnQRbxilvrA/n2trggKF9u2j1urTDUzSVXcbGF+u8T
	YQSN0DHB4TIsj5G1zEtR2f15SUzvULE8dlIJbzR5zYKHabpCMYbYgK5dq6kW4h3QoPDZNFlJ3A+
	57PCo6g==
X-Google-Smtp-Source: AGHT+IFOkXw4gHGIh60oSE6f0M1fnutLE7Ek73wWNqzXgh+uAjUI0U7Gu1VHfmKHmKh6pBG4MCH52Q==
X-Received: by 2002:a05:6402:3582:b0:602:14f8:9a29 with SMTP id 4fb4d7f45d1cf-602d9bf1986mr4616222a12.2.1748370805364;
        Tue, 27 May 2025 11:33:25 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-604f1204b68sm1234923a12.77.2025.05.27.11.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 11:33:23 -0700 (PDT)
Message-ID: <b163bb31-2d02-47bb-a7a1-91c1fb007523@linaro.org>
Date: Tue, 27 May 2025 20:33:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: sm6115: add LPASS devices
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-7-9eeb08cab9dc@linaro.org>
 <26afac49-2500-470b-a21a-d57e4ff14fa6@linaro.org>
 <DA735DM0N649.3NLLMFUW7ANNM@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <DA735DM0N649.3NLLMFUW7ANNM@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/05/2025 18:32, Alexey Klimov wrote:
> On Thu May 22, 2025 at 6:52 PM BST, Krzysztof Kozlowski wrote:
>> On 22/05/2025 19:40, Alexey Klimov wrote:
>>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock controllers
>>> are required to support audio playback and audio capture on sm6115 and
>>> its derivatives.
>>>
>>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>>> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Just keep one CC.
> 
> Question is which one now. Konrad, is it fine to keep your oss.qualcomm.com
> email here?
> 
>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Missing SoB.
> 
> IIRC I took Konrad's changes but at this point I don't remember how much was changed.

And stripped his SoB?

> So I need to switch to Konrad's owned completely or somehow indicate using tags
> that it is initial Konrad's work.

No, you need to add proper SoB. See submitting patches about using
co-developed-by. If there was no SoB in the original work (happens),
maybe Konrad can provide now publicly.

> 
Best regards,
Krzysztof

