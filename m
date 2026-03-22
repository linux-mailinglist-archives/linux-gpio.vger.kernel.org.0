Return-Path: <linux-gpio+bounces-33984-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FNSBA0P4v2nkBwQAu9opvQ
	(envelope-from <linux-gpio+bounces-33984-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 15:10:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5FC2E9928
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 15:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0162300460A
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 14:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC2B3630A3;
	Sun, 22 Mar 2026 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="id6n4njQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068BD30F924
	for <linux-gpio@vger.kernel.org>; Sun, 22 Mar 2026 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774188605; cv=none; b=pKdIZXFX6irnDmyEvKKzy51jbgsAiLsmZZSC58ViPU0bfet7i/6kNi0AHgXK+jnmP4DEQ2XGk1GCn8Y3wa0gIuLUlfDtn/SY/SBv2M0uP3BMfQfqHB1qc3V592vpNg+Ggy5fb/gJgImPyc7RzPnJCyttKpwUWOysjIWCpTWNY6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774188605; c=relaxed/simple;
	bh=wYM7rFD0Aily77SHukDAbLc20kppynNkynaBv6rhwDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfR5oK1VAB50Y7zhxxUTFfStzjoLg0U1eUgVrj0K2lkXY4BffvTgdJ5MWvfkwAGluugz/B7rFKcXS17Ty/X2Py25KfhOVPVepXHIfazNWP96DyYPa+u/HjiZdbyqIm5XUg+uAbTGf4ja58djCv5RvkMGS2zoK1d2ky7B5IRingw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=id6n4njQ; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4237194eec.0
        for <linux-gpio@vger.kernel.org>; Sun, 22 Mar 2026 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774188603; x=1774793403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8mdNj/DvPq3mNb+2oWEDziL/aWG+5kHGL1UMe9SoS10=;
        b=id6n4njQLlp9vG5PgOzfH6PcgoCnkzCG9N34TNxv3I8ZDdyRbeMF3Sp0OcQk8FVswP
         TFZM/8yRIXm/8Ec1KPlRpD98z4RrllnKDMgRc5zz/V2jUuVscJypSNMjf9vR4HY42xMn
         XlfNiC52io+oXIPBK8LSBOjEhNfUC/+dI+9L18leGnANookXrvMCcHrh4HMsZiQx12VR
         BlGydsWBVGECHHcGbb056I/pwMyT1VrwDvfZ4gr23x2LqGg16EN5+CyRk5nssCYcvIrH
         KqwyW55OmPoZhlHbf1B5iqIibYpYTKR/9C01P753xdRiojzgifFqwcI3Nm+FEL0rs5Oa
         7dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774188603; x=1774793403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mdNj/DvPq3mNb+2oWEDziL/aWG+5kHGL1UMe9SoS10=;
        b=CkR5inplFNrNV9yq8AXWlTAUGyNJBn7JyRpzpuvEMIgi49YLikX2CjTOrfyH+QGO5j
         W3sUOANs2YJTfR+Xca3raoTvghgQYOvwaax207j+MpovZq+FFBqq0xZx57g451X3KxjP
         jRmWfJmJIW9E7E1ul9U/hetLO/9qE0k2vbeyH05bNdsJSxthEVULYptq8aJzJOyopOMD
         CwxN/Z8cHTJqnimggwNDTGzy03huwFxrfUWdki/CS5HrEIF0a/kpOelRiiKc5M3pqal8
         nmMzCGtbhoqKc76nJ8CLb2Ebnk47zR++yXk3Uv6u79oC7SNEQIzaKX47fGEUDBBHgRWp
         IuDA==
X-Forwarded-Encrypted: i=1; AJvYcCWTSFePPU3zUGkj1bWsd9X7aKUkemyl0vcbnNfGLmr6wfB2V8e/5mb3Pg9WjFJyrP+OVhScIrRgkf1W@vger.kernel.org
X-Gm-Message-State: AOJu0YyvfViZghOzFm8cE72JR8/yYt2npeuhTSFkOimzW0iJEfqmBPIm
	wedQrW+aCPOwSwX518RqCiusk6rOSIgXGAJbECOguQhVn/+l341nWRM6
X-Gm-Gg: ATEYQzyuTPDiT0oJWQ9fAcJsaaiX8P0mQxxRVE+MmSLZySaJ4XlmaMfJ8GefVZsI4fO
	ipqYCgjNv5Ftax1b5gvsMaynfZdap5Ss7mSrIOSflVRst9P/+DPNwHUM2YBHZpLyPjKeXL7kYvS
	8TBLG5mtR1edO9q41q+3zGHz+bXgT+Z92MfkrugVv87brrB5xIlIByrksQoKryags0R/8j3iRcv
	fB9fe632ridY6BGaVIheeEEtoRZlkqngRZ65y+X7MiZ+JaIgkMRp/n6J8XPIy4aftQqArXZnyVs
	d1X9FXpKbx+EHGBzMGWSuVDet3x+V6qyHnXJ/0TSBUj04CtFvWpOWv3fqaaQMcJlQ7gv3DfF69T
	C7+8xdtAhgLgsGgpoG1mdwdtiMnZmQZAT9HyhIQAiQuDBZUksQb/Q9YZ/rir/x/DrjHtGGFUnyz
	c9DNEn3VmuZmQ7xHHh01QeM7s+2xG9OYFM06oim5xkFAHEMRtFBj+RNx0DngZCxt7GXiGTWJ3n
X-Received: by 2002:a05:7301:6704:b0:2be:ca4:e13f with SMTP id 5a478bee46e88-2c10975fa26mr3701226eec.23.1774188603046;
        Sun, 22 Mar 2026 07:10:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14cadbsm12025311eec.3.2026.03.22.07.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 07:10:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <67747945-4009-4f56-a931-5057729c199b@roeck-us.net>
Date: Sun, 22 Mar 2026 07:10:00 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] mfd: Add support for NXP MC33978/MC34978 MSDI
To: Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
References: <20260321065146.3918882-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260321065146.3918882-1-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33984-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,roeck-us.net:mid]
X-Rspamd-Queue-Id: 8D5FC2E9928
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/20/26 23:51, Oleksij Rempel wrote:
> This series adds support for the NXP MC33978/MC34978 Multiple Switch Detection
> Interface (MSDI) via the MFD framework.
> 
> Architecture overview:
> * mfd: Core driver handling 2-frame pipelined SPI, regulator sequencing, and
>    linear irq_domain. Harvests status bits from SPI MISO MSB.
> * pinctrl: Exposes 22 physical switch inputs as standard GPIOs. Proxies IRQs to
>    the MFD domain.
> * hwmon: Exposes thermal limits, VBATP/VDDQ voltage boundaries, and dynamic
>    fault alarms.
> * mux: Controls the 24-to-1 AMUX routing analog signals (switch voltages,
>    temperature, VBATP) to an external ADC.
> 
Sashiko has a number of concerns with this series. See

https://sashiko.dev/#/patchset/20260321065146.3918882-1-o.rempel%40pengutronix.de

for details. I did not check the non-hwmon code, but the concerns raised with
the hwmon patch seem real. Please address.

Thanks,
Guenter


