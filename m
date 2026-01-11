Return-Path: <linux-gpio+bounces-30409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5EFD0F335
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 15:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C2CD303E0D0
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 14:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695EF34A79E;
	Sun, 11 Jan 2026 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Qam1s0sk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E338C33F8AE
	for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768142804; cv=none; b=FvQFqYE8I8OwznKYzugU7N4M4gKNl+KAzugwOOhsovvFEc1Nz6ued2YazFWw1A1tfsmwemZhLxpbGSJlsHLvK/CbAiCHIu/92wsRB/OWpGcAcjdo7K4VYTU8iI2e4IeakYds8CyJ0NRhQDpKVQf2yXxFr2a5EYQ05DA+zM0rJqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768142804; c=relaxed/simple;
	bh=L2SAqNmu61MHKLD0agICr57xkRB0iGTI91g9rMmmRgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPgyJmwsblvn7ILVJXee8+WAbfPUYdtL/ha/D4YCrWoPIhhkZ2xdxuwg4Fv2MRGgn1sHoJOXyj8HnjNFVOssMI/5hZIf+2/Ep3O1vkZ+ydOkAiJVwNq2N7XuHx4G+mxvoYfcOcfGCby/2/MZJtFSoXnWQ1NWj+LMmQ9laHSEmmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Qam1s0sk; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-64ba74e6892so9306486a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jan 2026 06:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142800; x=1768747600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=998LIQD26tTlqKe1Nt9hPTV8z5SAR5Xb1tsWRfDj7yM=;
        b=Qam1s0skrMJn1KfWZxSe96IKP81h22WhBDibkbxgWIUwpBSQNSN536T77TtojW3nxq
         kLFoyDPha3E1j8A98VyQxWws3pi3XVHEjYrLvuh2AjL/vNPcDkas+WMRnHVItePkIK5p
         yjOS8EtefDgl07rBXwJ/tP65Y/Vw1sE6EhWNK6+VRchLP7n6emPQxYYi/5H9xtlL6/P/
         ns7a6XFDQO9GAFW8hheFyqWsQk6Nsce0VyXmYi3J35Jk+Y3cTtzFIsWLZLPcx+gnyCUs
         9g1Vv5mta+IVdq3zoLjpJHhxhqt9cTIhUzchJVlA7JHMdhTyomaoN/CV+gPsigwenQok
         wOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142800; x=1768747600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=998LIQD26tTlqKe1Nt9hPTV8z5SAR5Xb1tsWRfDj7yM=;
        b=lAxe4eml1Y9kwgMvCuKeU7eax205r+6jlg4iv1w64VU+0bY/0hqkdkfASHsv6by/cM
         0CSw+YM8A3B+BmeX2fNVmQ8CgpH42LWYq+A6kaN5txpwp07DJI8o128HfceoatVnniiB
         z24LeXexnudjKGHPRaP49Y6PImWJuA40xedc8rxojehSmJ9OKpbwFbewCxRxx5VuWjQ/
         cdocHSblqoWS9JbRtCFo5QfBPpRLGq2HQOqWvWgxtS+CkEXfghNiX7ikiEfxFW6Kh155
         4NJGDIUWLUt2061hxjwTvr1i7kxpSH5s+wToM1XIzMSMWZmoHAHRFu1iMUW0qFS7/Zwo
         IrGg==
X-Forwarded-Encrypted: i=1; AJvYcCUHy6pAohRrWp3HkJoFBmaNcXT6lfnnPQj5IDQCGUbohQ1hO4YSeFiG5JApG40Dne88Yg1VX8nYJdgc@vger.kernel.org
X-Gm-Message-State: AOJu0YxnNSdy8lRTn9WwehzibJyKc+OiQ0N8Y5jndXGWi0ARf53pDNln
	3hszttQ0DM8DbwDdWQ3cvJ/0eToewoMQQzwmqDhTuuzzVH8833jL3CAGKogRyimMjh4=
X-Gm-Gg: AY/fxX64FY4pubNkjsaMggR+6an+nmEG/rp8MpB1tHu4RWH82YVmL29NFJQkiQh/Ius
	gfjebdcjBkRAuktYeb22cs445JiplNr1Y602fx/j9NZTgdffMX5fASP7jyngLs0AkD2YXa3t+6+
	J6EnN8qJS0LGKmyI8VQmqCqNBBOilYevulYc9FGundm54GU/tWLBUESNa59AH+g211c8BnJqou1
	ChQZHIueWJTGnx7bj3nryqYvtAPON20YVHr+5VvTmDxM0brhsctzNVG1/5LenlvvQj+Vl2Ph2+o
	lFBagpxEvAscKjjqwAJLgkwSMq4nwuwJ6QU1q3PofLvb7zPGV+UoRqCA5Qavh+LTLroD4VfR8wp
	yI4ExR8hSpnYLVQ4HiOhEYLDwGU+YP2IC5xWkxVEiRJgbRs0FB0mhaRkQwLfgBIkaqCvCsnf6ka
	6yLxUcXvCmRnaunCwfE2g2Zns=
X-Google-Smtp-Source: AGHT+IEEnxtsLJjgQBqtCtTKdKKJ7nKe93tErDCONdjzSpalyD4Cf1jf8cogFFk+Jwao/l06OHgHEQ==
X-Received: by 2002:a05:6402:26cc:b0:64d:498b:aeff with SMTP id 4fb4d7f45d1cf-65097e8e49bmr13880469a12.34.1768142800347;
        Sun, 11 Jan 2026 06:46:40 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d4acsm15318996a12.30.2026.01.11.06.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:46:39 -0800 (PST)
Message-ID: <0ca4477e-cfd8-439f-946f-9d0205b62c6a@tuxon.dev>
Date: Sun, 11 Jan 2026 16:46:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/15] dt-bindings: arm: AT91: document EV23X71A board
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
 <20251229184004.571837-15-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-15-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 20:37, Robert Marko wrote:
> Microchip EV23X71A board is an LAN9696 based evaluation board.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

