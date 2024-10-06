Return-Path: <linux-gpio+bounces-10889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF2A991CB8
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 08:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F2E91C21640
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 06:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665F3158D92;
	Sun,  6 Oct 2024 06:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="pDXP1gSt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D092C18C;
	Sun,  6 Oct 2024 06:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728195027; cv=none; b=nDClBsVDscRfWE87QJ8Biy9EaXFtDlLLeD3uV01fgYqFMjVDJu6CLvWCDB+drNzyJxz1BjfdPPS16rBxNZWetkdh3gX9Z0c8cLVmzShyqPNHSg4qXHrYKM6ZSJjujQXd2TWVbkDSRHlYHF9xvU/6dwUrTEgI80FhTrnsNZQnjok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728195027; c=relaxed/simple;
	bh=2c7SLZYu8IRHUh2dBV1PwcXRUlVdLZ8BkW9qgWUwd+s=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=DSU4aIUnNrJhYjpL4D8ambaccI0qIj+I5DPUUUI8YIxALE2tqsUMAZj9KnfWQJR4jAgR7eLZnAJO53zt2dCChjd12JUpbcnUflFYXnqwbCjkskpNmSOIeajUmOsL3FqqHIq4JNmvuz9ZJU6LAM5MFu2JxL33MuX3kDpt//JaOJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=pDXP1gSt; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728194993; x=1728799793; i=markus.elfring@web.de;
	bh=nfHT270wEl9AxgDA67VCKhwp85VuN4fZDK+Q6206vzk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pDXP1gStZ9wjaIg8ZRDtUv9ESbxYdagMR89X+XbGTvUQso/xiWwhN3xtP/bMvyEv
	 b8mv3fX1HFeCqd2rxTDuqCWXzHgP0hrb8VVVd7t01QI7w1WBlCOvAsGePGUtFWswt
	 5xis7C3/F7pYyGCm5PCuEGWCyApywr5vFqkAtjwIrLYqlcivKy8viAwO4wUu3baG4
	 wbGMLyU4ffB/UvpGd8I3OYg5VcndSQX4J2HIaPJvcUwTAFara2jImgoqmagGZu66V
	 +lle6biJ7zEGve76JeiQFL/+piskEHj28DYoUNQI1Ye4CZxM2WtjiAY0ACaA7RAzF
	 V+cD+tZRNZpI6s29aw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2Phc-1t04p51ZR0-001VdC; Sun, 06
 Oct 2024 08:09:53 +0200
Message-ID: <2be4c920-b4c7-4b7a-ae63-258f2d86df92@web.de>
Date: Sun, 6 Oct 2024 08:09:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Drew Fustini <dfustini@tenstorrent.com>, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>,
 Guo Ren <guoren@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Drew Fustini <drew@pdp7.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20241005-th1520-pinctrl-fixes-v1-2-5c65dffa0d00@tenstorrent.com>
Subject: Re: [PATCH 2/2] pinctrl: th1520: Fix return value for unknown pin
 error
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241005-th1520-pinctrl-fixes-v1-2-5c65dffa0d00@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:80QukG/njMlE+c8X6vqS9JBjUh36l0QZ3c40I4xW7dixPPcFjlC
 N7FvOqkAIh3Jd0tAJPY5bAhed2vBDi9PpRPY97kqh7k3vkMhO0us//5xhCBu8tv+06ytJWo
 172EnNSA12qrnpSTNILKGTSTnx2XDGIqTxP2WAbcF1pAjLi6qanbUu70qrl0svCS3mA+XPB
 ZX7VkiiX6/4DOhuN9wHYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xTZ+ktdvsFE=;sJd8/aZu3cz3tBsX6sTGATwInWu
 8sf4wiClEXP9QVmAL33Q85yUMmRulYEzs2gZTXtFHNxCbUTfzz4ew9bG2K+x5+Uz/7kUnXDDw
 pTsUgYJuHrP4SVjB97nlOxaunlRistTgGIExhoKXkCZDJg1hTRGVkjOVL+MGBv9l5orXOfj+J
 oHsP+xEoVLgeXeU/L3DMB7aV033+1bVRsKtuKCj8Lwrd3LUzZIB4z18Ciz3CHMdbPjbM1F9r0
 uCydirtGaHw5cTEgadHY2aSaBAfFd3+cvcKLqbBXASo4O7wxT7y/XeRJBwqYdmMGCIwtPmPR5
 KKZxGZvidyllF22NGivnVCOtIBWgLivdR6PD4hKPKNuP8bJvuYVLctP8h4tEGF+aWUUx5T5S5
 IbPib6HZFbOkJufmoTUEML66VCd5zNO1HmIMJ96rnC8uoo8bVZ5kgU5t8FkFFhNjnQvvjlXgH
 slcEuAOQ1cChwvx6B6zsgqv0eWzwgVSU+9llHJkxtglIQgLnuWh/SC0GK1IyF4tPTFqRt8H64
 N5riqPE2+WOoC+B6KMtYZv9n6gJT++gHe3YUkXwnGHpV8a+8EWTv/OdDpQvO2cgEbDqzqvWH4
 yi7pkmPa0aHHVvY6pUxXTYGOjJw8kIcVrbx+OOcb/W3e+tfq4HiKxlcZ1wcvuITSaUjuAhM1H
 8Ti4k3wL5ZfJx5/lni1SEu07veJGXT+qOk/au4Jk+7eF5ROWMH/IwiNXBU7N28R5I/VZ8tTlk
 wmVlU467PSLbCSUxetb/GgPvwaROf13UulYHE+s6TbZOZgyJu+FtPq1cnJEt8U464DzOVKApl
 veuW1YmaqxkvUdxBf7Zqa7xg==

> Fix th1520_pinctrl_dt_node_to_map() to a return value upon an unknown

                                      to return an error code?


> pin error before jumping to free_configs.

=E2=80=A6
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -499,6 +499,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinc=
trl_dev *pctldev,
>  				nmaps =3D rollback;
>  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
>  					np, child, pinname);
> +				ret =3D -EINVAL;
>  				goto free_configs;
>  			}
=E2=80=A6

Would you dare to support another jump target for this assignment statemen=
t?

Regards,
Markus

