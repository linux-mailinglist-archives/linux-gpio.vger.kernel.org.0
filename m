Return-Path: <linux-gpio+bounces-11229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D1799B1EA
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 10:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FEE11C2042F
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 08:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D7A13D53F;
	Sat, 12 Oct 2024 08:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHeNoOBW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF031465AE;
	Sat, 12 Oct 2024 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728720100; cv=none; b=CbjG2vLy+XwN8e4B5EHHAL/fXq3p07E1oc6g1p5Y6eWWVPYybRXpMHEdoX7YHIZ+XiHk0AZ8IybECFef9cv3ZWLf9qTaL9Bq0hYx/UL3NkaMd/23cSioDAh1ouS9sobpOeOaLXtmAge1ZbS6JSKjWJXL7HGL3RY2qMCk75l7cuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728720100; c=relaxed/simple;
	bh=Oo2h5r1lzwsRxzDZwY6XUrvNvH1dhND69+z6NLtBNWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLTyEf2sbop3ictK4FTjVVttlaktQnYrtsc7ErvstiXkydjkUgJpT6o+wuZ/ruqQusqwYBoVwojVg7SKx80KkXQK/qOPqN0L+y7f2JLLyeM0WA2QcPIhuygsnADpV1vmo/wOmDoXgaGY7ccZ96ec4VqzBE7wy+9woafXEfbslsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHeNoOBW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a99f629a7aaso3520466b.1;
        Sat, 12 Oct 2024 01:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728720097; x=1729324897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TExD6lpXamjjjy+cKE126WWHscJMcaANGocrzhJ0a6E=;
        b=eHeNoOBWVTfNdt+LwvNylBUKf9UIynMZgWjI1cz37uErj2Al6BkHnk8Ia/YaPCxqiw
         gJdxEYHq21GDKXY5vFIleHljSwkorZttzIo2lhP3YnbBhPwDHyf6CbCmbXKJ5LWPOkGC
         3zqeCzYgKvUc7TQbqj0dge8LNX57jTkxYKzYToZ7RIEhWzO5HNixO8S6jw/eJGGZGua5
         1lXbs8aivjXLM5uiAwZ6xL1cuoXHBOb4hJzTTTOBEzgnkJ2X0bEem5aaxvyelKPw6H3E
         p6quIzocm1XBlFOdyeNaHY6LkSAuJC0Ks4UlzrY4aVIUek45rWPIvDUdTBOoTEUoTeqK
         cP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728720097; x=1729324897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TExD6lpXamjjjy+cKE126WWHscJMcaANGocrzhJ0a6E=;
        b=hN2DBnE1fmKkJd4UbPCEC+3uX7zd1d1S6nyNFRIbtqHgJfylS49KbOg3WEVBYWuIOT
         tGEw2bBBrLzD5ZZQjvHemISTSMMpzCXEipxvATuaHC6s2YD2DVY1pNKbdW4eDdPYHN6J
         CYxdTe0Ud5SjiLIFnwPeqGA7G4+TTRgMiIxOKqVB7cOxb+nG8kayk5uYLCwVSwiO7Zkr
         aXonoDceNMSToJmn0NL7FM8GuA4IfQwBEajKIzsvSQpqwvSQBNJjj+EagLlucL+sXiso
         SoCiVHIOoPxfpqW7JkIGL7RXIDbiDESCVhlts9bVSV4rh/lUXqmMTZXeGUhwd588C6Nx
         4DBw==
X-Forwarded-Encrypted: i=1; AJvYcCUpS5/MvPvs/DbpX4JTxd4HUAmfddpW9z2dJeMyAZ2PTqii6TfSqTa4LbZ0rk3/mql/rxNjgNTk+WJk@vger.kernel.org, AJvYcCV7cLRtDaEi3WgkfNg2/V6qwFB9W99MyE5oEsoAe1u9SVnYHmcykfGCAzEW+GUkgxQlvBgme+Njh248KA==@vger.kernel.org, AJvYcCX2rtIS/vDMyLl7UxcKGYDz8SnPrO1ql6QT4FPfveSnqTvk9ri/16G1PTqfBdHJW9gVUYZ+cZ+DLDuh9aG9@vger.kernel.org
X-Gm-Message-State: AOJu0YwJtGHCkTy9i/vGyuIjCaEJne5w3Hhthh5KRdic5mEL+/YqXJ9J
	+B4bggq6uxZsT1kzhwtzx6fz9A4RUosui1zF0x3dOdi3KfQqLGHt
X-Google-Smtp-Source: AGHT+IHTCePNmn1jdceOqiMTn3NmaQ5zU8ZoSXNad7Jbdr8bBJaYIvqEv+nMAc5bQFf24gN6hDBvDQ==
X-Received: by 2002:a17:907:1b0b:b0:a99:d587:6046 with SMTP id a640c23a62f3a-a99d587655amr193142766b.32.1728720094904;
        Sat, 12 Oct 2024 01:01:34 -0700 (PDT)
Received: from [10.50.4.74] ([95.183.227.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99dfb3539fsm81883566b.134.2024.10.12.01.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 01:01:33 -0700 (PDT)
Message-ID: <9bbaad91-e439-4b67-bcff-538679b40b64@gmail.com>
Date: Sat, 12 Oct 2024 11:01:32 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] dt-bindings: pinctrl: mediatek: Add bindings for
 MT6735 pin controller
To: Rob Herring <robh@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-7-y.oudjana@protonmail.com>
 <20241011165841.GA2504125-robh@kernel.org>
Content-Language: en-US
From: Yassine Oudjana <yassine.oudjana@gmail.com>
In-Reply-To: <20241011165841.GA2504125-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/2024 7:58 pm, Rob Herring wrote:
> On Fri, Oct 11, 2024 at 03:03:51PM +0300, Yassine Oudjana wrote:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> Add DT bindings for the MT6735 pin controller, which consist of macros
>> to be used as values for the pinmux property. Each macro corresponds
>> to a unique possible pin-function combination.
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   MAINTAINERS                                   |    6 +
>>   .../pinctrl/mediatek,mt6735-pinctrl.h         | 1148 +++++++++++++++++
>>   2 files changed, 1154 insertions(+)
>>   create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
> 
> This should be squatched with patch 7.

I thought so too but checkpatch said otherwise:

WARNING: DT binding docs and includes should be a separate patch. See: 
Documentation/devicetree/bindings/submitting-patches.rst

The above documentation says "The Documentation/ and 
include/dt-bindings/ portion of the patch should be a separate patch". 
Does it
need updating?


