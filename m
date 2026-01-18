Return-Path: <linux-gpio+bounces-30696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FD7D3967C
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 15:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EBD4230039DE
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 14:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D00337BB4;
	Sun, 18 Jan 2026 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AU1u6WOt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B3D3321DE
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 14:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744996; cv=none; b=j22y5psF8bGWhE6uwMBhT6H/S8DWWaJOmdqN7AOPMghTXNT6OSaWHRUQEszgUevzPzDn+dv94i69moRTKsNaO1CcVO1G8+UMG+tP+zy1RZc1vpbT1aGzJV5tmPeJjwpt/7T4hzX33seFbfFZP6pFAEtKdPq79ImERfEPVl08sMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744996; c=relaxed/simple;
	bh=/GsF+Uwls1Cn2yinM71Z8W+ioXcZeW9vpkl4szRkNjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rCr+PFVmVTXdP6iNVRwfmo+6v8uYtOQeWqLCxJirTyfWHoOLmglZTdsO4tf4QPJGVela79cFt8wkGqiCQQbGSwsF7f2a+GJS1i4kt+OVChTVrmQmeyozmza7Wa2F1CKewQKNWtnn2klvgwuvBcChkpUP+b1JNGJzTUK9+nRkeSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AU1u6WOt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso22472975e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 06:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768744991; x=1769349791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IMK1YqKVaUf0IoyRsQOMCKJ4gS01F7A0JEX5JckEMXs=;
        b=AU1u6WOtLoi8xhtxE3eZH2de7tMEOJBbWbxjQ3yhiZkjPT2U+TxzYsQSeFKocZiPFp
         AfUR8WeygLNHXiE9Viiw1RtzFAsj1KyVxaWitGd2d8N3ANyj+Y7kO43+hm5JZhbBq+Lb
         lPvGKm4ZddOA32TKUnbLjuE3F06FWBpu3jNeWG8PxL6W7eEJcdrnLaI8SrtPWsd/V4W6
         +EAvlq2BKqQ/VvftFp9V9f78dx1EN5wahowO2gdSHzutwK6Z8mTGZRreowFvAg6oCWZ7
         I8ZU60NADPdABqce0/chNtZRxbKpG3J3sqT37gvVSYI6RT6C+EjRstJOaUfYQFkChaEz
         m0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768744991; x=1769349791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMK1YqKVaUf0IoyRsQOMCKJ4gS01F7A0JEX5JckEMXs=;
        b=Z45tMEwDt3NLzpcU9I0xq29U3GM/fjT7VwBTub2JJtczTd1UoefRnfWDGtoKlcntrJ
         dYKHfdckC3WM+MAahPjCcSB7/mgNiBi/rkFaC1ghk+SoTqdLFvmMzT7wkaaBDa9gbOqi
         NVdkKf6T+WnMVdcl2xd/ASM4l+6KrjPIQhSU8QpmSxLpIWjOoW9V4mFCJh3IZOugJ+dd
         0u96ex4s6fXo7oxOMEBzJZ1FgZx5K4daX5/J49H5vILvgEn+m6gyfTFQuEFhCM8DbRuP
         dTkxMCW9MlTTf3ELw9VLyO10j5+Brm0Px/xE6IyMcMIrvkEJEjJJJ6teXtzGzcd3T2a7
         Tjzw==
X-Forwarded-Encrypted: i=1; AJvYcCX85og4X7oKVMdUQxD3nnUEASVD+jMj4ennjPtosv+BaPy1+I+hGdU8dr7lY2vvez3YcPuYFHHhLZ8K@vger.kernel.org
X-Gm-Message-State: AOJu0YzI0/60glMqu9gjixGizgegdkE36kRKnUG+QBsQ2s5HDggt2ch2
	ky3LMswhpfNcf5slefVjoOV/fEZXBfRBb2eceGPVW5HaZKdd0nMYWZA2+zbV0kILF4I=
X-Gm-Gg: AY/fxX6VCSxXXMXrKq7R7fx794aSgbFy0GBG3NA1mNWRKRk/45KoDNE2rsIm+6SG6MF
	4eMvzzCYxcdW5TXidotVZosSKpWH+BioxunvuDkNvRE7N7sa8zNoRgLTXC+Lavw4mWb/R4Lw3+0
	T8ziJ6PPrdbyH7xvFyLU29R/OuCeHHQ7c04Eiuz6CaTeOOKuParNMIAf2jrjG7ntxYQjdHtCtN8
	5kiBWU2WaurfdFu+hqWUHBmFlfWZWTOLMKSG7S9F+IEsv3hJHS5rqsCVu1ARpouuhMop73QvtbM
	jBXBJQU6jFL6qTKDItHp66LmV70yH78iLkjkk16A0jB+aLoJB8UecqDSaV0EAIHKgQj0V4NCMHP
	G5ZzGJlpZt/cXv5kXk+uesAsAruVC2H5YRsO59450TlvSe0LailFmtbm5IQWqesMBzWJqPqdnLj
	cKwfCzeRB6Dpo8yOy3mw==
X-Received: by 2002:a05:600c:4da3:b0:47d:7004:f488 with SMTP id 5b1f17b1804b1-47f428f5e9amr84049025e9.10.1768744990847;
        Sun, 18 Jan 2026 06:03:10 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm17725892f8f.3.2026.01.18.06.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 06:03:10 -0800 (PST)
Message-ID: <9c34b805-8c6f-4711-9718-6c39a141d451@tuxon.dev>
Date: Sun, 18 Jan 2026 16:03:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] arm64: dts: microchip: add EV23X71A board
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, lee@kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, linusw@kernel.org, olivia@selenic.com,
 richard.genoud@bootlin.com, radu_nicolae.pirea@upb.ro,
 gregkh@linuxfoundation.org, richardcochran@gmail.com,
 horatiu.vultur@microchip.com, Ryan.Wanner@microchip.com,
 tudor.ambarus@linaro.org, kavyasree.kotagiri@microchip.com,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20260115114021.111324-1-robert.marko@sartura.hr>
 <20260115114021.111324-12-robert.marko@sartura.hr>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260115114021.111324-12-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/15/26 13:37, Robert Marko wrote:
> Microchip EV23X71A is an LAN9696 based evaluation board.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

