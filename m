Return-Path: <linux-gpio+bounces-30406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C26D0F352
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 15:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C5AB306CDA5
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 14:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508E634A793;
	Sun, 11 Jan 2026 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="X9Wk2tta"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3790834A3B1
	for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142730; cv=none; b=M23sSC6+GP5xUgsB2Hfeu9shuFgllBf8ToXZSs5QzLUci9wp4a7j6tleYepY7XzbMTBoXyX7rCwXsTLKnUgIqlASIMkFhAtpWVAWUrrtQwVwj1EsdIzSUx2pe31aWPCybbUcEeqkFRZ0ZnkFKNoNVMIklRW1faiM95wQG+mu6Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142730; c=relaxed/simple;
	bh=YDHNGLJfluFKzT2RaL2uk9Ugi0ok4Sk7jIeMDkApg6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPrxx7CxX55DtYc8w1/3F9UGoggDk6oWqqymvK+4OPfl2zlox1A6Ti+buGioxZCM3saW6yocBos36IQvxVbI81TWJWhsUdrcNtzW7SQvIisRj3T9M7m7vE15uUXGTTMa7k3dDtkXVCnfdpKePmtcGR2dA9cy+TL2OVdo9caMCoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=X9Wk2tta; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so10967401a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 06:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142726; x=1768747526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6rwalswAWwTHAknUrP94zFyJo4NhuP+T6GegkCWM/M=;
        b=X9Wk2ttak/FxxYeh5WLK137PvXT2Bo+6f4tTd7DoZEvDfH1xyhWoL4n6yF/gvnCw8z
         z+h9Pq1VYPIop7EYoYHEF/ZvxNpxMSSGAdL55uhaBcqSfbLSS6+O0g3gtUKbcER1Z7IK
         s2S2cmElL/gpcQWFvwhm/u+qSVXzl+qK0VjAc1Dk2jlacBc88hyZK8whHoOR0r+uNnl3
         9BPa6sdp3h6wLWdtn2N8cV2+HuBUCgov4KQjwoG6XwRdQ8sxApffjIH+TQL/Pc4vRPxm
         y7mX4RoTw9OGMaAtnsluf6omcNfoTTI99nG19wYn4YbH2bFtmLM64ISHwLjSgcuMJIRj
         qGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142726; x=1768747526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6rwalswAWwTHAknUrP94zFyJo4NhuP+T6GegkCWM/M=;
        b=UXPnOd0xiqNbNQ7hkG2fLQ0ZmVjFinxqVWHB/yS9Jn+WFNijL9gTgHOxYYeesmOH5m
         rvMQ/WV2NnWw8aaBdl1C749Tn6H8ccQp3vpL+VVqtN+IquF2gCvH6yhJQwQS+v9f+9U5
         5HTCO/C4nULwbpTel12mDgbemK4g7fJW1K/m9s5xxj6qcpfEXcKwcVACjEkUgl6yhskw
         zdnOWcAzgvALQFcNi4gpL91FF3dFrLR92KgJ3BKel3RpPm/tSksUV0DkUR1N9SeZdqnQ
         qRa9ycAmfUcv2OCB9qM5+N31HlIxH42rm5WtqmD9qC7sZJ+R1bEz9cp8qhLWIqBhdSn6
         g5Og==
X-Forwarded-Encrypted: i=1; AJvYcCVYMuo/kkDzsSFwe0zowkhcplzi9z4417b5DnN1r5rwGwASfIdg1nI6KoURZ2xJc6HSCELD66m5j6Yz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6YyrB2WctBu3QpntLwMN3Hrz01k3LH+9yP2M5A2y2VzA0EpD1
	LtYgASqwv/n5Kc0C6gFpgKanEStrBzs9MW8qHAnzpYVbby+7mNTvmXEbpUt/4xW5SiM=
X-Gm-Gg: AY/fxX7iw3Z5rhzWy1+UbTccARcd7mqGaQ2lOxjs9LiK7aSLrFj/SNYHpSV9r+vKS1c
	HMwDnzCylf5Wp7Zeh2pduUDqi0d7PeAngclrro3P/sAcqAHoE6roOHKHNYUETnS8ix+mYtZQw4i
	0XWZ8swQXFAvyB2Vy0al8R2q6meL0qGT5HDA6+SDNcPS6W3Ml4vPQ1HL6/61FT9TPBLufdsLnHX
	bJr9OJA2KqlLakD7hT9fhxBaonjgvX64of83Bx6cR0Ec1aalGuMP1weDMlcSmamvVlReYtMZF6w
	JKfEA77v7bpkaYcKcId6yJfOJUJ09QX7UYvpCcum6RNHeqzvUOmIQHtoaA9hAJE6c6gnWQMSu6k
	xT9nS2bVrGsXDvDMxRo9HjVOFXQ+uMwmT+EIyzT1BoSam0JcrNiwjuGERd4yBiywP5WHk+NZrOM
	XwaXfE6QAL/0u6NZB3nJejGMo=
X-Google-Smtp-Source: AGHT+IGvS7IBApFn5Y6caZIpVWCcEKkW6+CPDWe6wxvm6P/BpWNKX4ZQoy1X15u9d+HjeZrWR8LDZA==
X-Received: by 2002:a17:907:6d10:b0:b84:40e1:c1c8 with SMTP id a640c23a62f3a-b8444f4afb5mr1764352266b.33.1768142726523;
        Sun, 11 Jan 2026 06:45:26 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a56962esm1699865166b.66.2026.01.11.06.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:45:25 -0800 (PST)
Message-ID: <7081b61b-599d-4a59-8a27-291c55a0e52a@tuxon.dev>
Date: Sun, 11 Jan 2026 16:45:20 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/15] dt-bindings: dma: atmel: add
 microchip,lan9691-dma
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-10-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-10-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

