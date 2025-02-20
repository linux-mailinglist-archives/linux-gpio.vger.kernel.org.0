Return-Path: <linux-gpio+bounces-16287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFB6A3D9A2
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7142189F27C
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 12:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249271F540C;
	Thu, 20 Feb 2025 12:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="qZ6OvuUz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3391F462D;
	Thu, 20 Feb 2025 12:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740053717; cv=none; b=AcbE8K/OWufBUUYhYD/NpUSGXpcKl/t+eCbL4v9/abr6k8/q/ODRq5xggWY5YYUH5FjlZZ4pq5PInDAN9JpUCoG1ASGFLykFNh/dgCEC2TKdbIQZ8o9BCs+4McSaawHPcW9d/bsychvAMe3bZshy6icee0dfABgp8a9iOtpYkHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740053717; c=relaxed/simple;
	bh=4mM4XiDYuYqyZvcfpTUgRaxwmQYQocp+UqmdOa99NzE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=r9OS6Y97f1ZxlqXPrpNWAUcnwrV6o8/Z4AWriHEYBkALR7E6++u+w7Q/l9DQC2i/MQ2Hw5d9YtiMQT935Rn05Jv+brbpz5ypTCH51TmSGyc7yslXBQcbDtIYcE7Jpo50fBx8Ldv59ITD9Aqz0JiOB4i+lLayA7Hmf+CmMtdq018=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=qZ6OvuUz; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1740053708; x=1740658508; i=markus.elfring@web.de;
	bh=p38B3629jIH/BYLg1r7hGseYsvl62uQfCXK0YgIagNM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qZ6OvuUzo5j1EbfQD6tvDqYIBCnfdhTfdNjBrO1h+MvoYxgTdm29ox8tWvXeQRSY
	 xGD2cIJMnNcLtnRK3cQ2HaEHrQgF4U846qhQYvPcr9w209nJlDwk2vlTbbUwUNf56
	 WOtWySf232+kb/83GhDnK8PLf+u+VYm0vioxbk+rEuyYOw4kwd+F6SO4apGC+3Rou
	 Vd1rrdeNeCTJro88KjNVvS6GCP70GTT4JFS66l7SOZUfqhWcOEn/rUZHCLFUFgKlS
	 IUpMHr8v7XocPh96Yz9ocn+Fwfw1RNH+Z+t34rer4P5RjEOYLTohyswkGgpUHR4c9
	 QzvNGeOJIqIKynDa8g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.25]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7usw-1tg7eD3tYI-0018LE; Thu, 20
 Feb 2025 13:15:07 +0100
Message-ID: <899f35b2-f4cb-4bea-bcc7-a805a409f7d7@web.de>
Date: Thu, 20 Feb 2025 13:14:59 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20250220085001.860-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] pinctrl: nomadik: Add error handling for
 find_nmk_gpio_from_pin
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250220085001.860-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OE1UwSWMbg9oiRuGsar0aold0VueVaUeNjRYwWzvluorabn24Ay
 /X5j9rD4LO+37DzdqLZimon8iCSLMJYxEbc/0hPhWvA3HYTK/v/Is+wKtkZkUrKBYsKkwtV
 eHPPsQrofUltXTO+fPukMAo+KLpU+XrqGSYR6NxhvGgriY/NmdGlyIQI+0boNj01eD0wQ+k
 awN221VpoJiclRMsHTjzQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kS62NSxv3DU=;G3wMwsoEDmdEZf5nM3alRIItu3g
 mNqJbgMRJYJlFZjUzMAc78Kz+ENZyABR4DjbXd0aGIP1AYTkgEHzEcMmr0NZTtkXbMdks+oXL
 2i8m4J/sKuroFGuF6MXtvTQxI/+QIz7k8DmcY0ksaUpWNwE43XoRbq0n+HTX6A7ch2tsFAuLS
 Wg71wCWwBhZD0woY3o8ZyWYB7Bfl98u5P1KQGbYTGVaQPGJqDnfHO9GVM+QJI9SEu6afm/tle
 ti0eoydLRNhuin6APHo2j2mI3IWLhdspYYsA1ux8a9m7uUK1wJSeA/uLnj9ZFoUwaMO3rv7pg
 RBXVo627SB10q/8DADLXYeRgXl6vEIont1DEokAJIQdxwczD9S8SvtnP5UnHnp4o7jaJfb6oz
 DQ4yLoz7m4pf2dIlAan0oTQbb5yIcybLFr3iIoLl11+JbJfgTkSdZf/hiyJPPX4DxiTU+alC9
 9Ko9mvD6WmBGVqGFGljduyqxEwtc9f5hJoshD82REPMHcD2ZAoSw1vm/hPh5l3ZmJyt28tBso
 aNIR08qhHnRkbGg2psV/dKzozpynh7+z7CKZIVuLYMoUZr/oqr5dSPfWnAP3xZCiTEtmn3u6/
 tn4CLbscrBoprzPT4M6BW0nd7pZC6HKIPFeZVpGMQnOUTLsnBHzceEJm9WV5+tXvONjYVhEfY
 JTT7kZrqAAX4pGfyNcVeIvxGCz8REXp14kQRsV0HTmdf6RzwU79OdNLsi3JeRybH+pTwrof0e
 5J5kqEQqDfyDO4rL1kQJH0YH1oKCROcC5kz1dPpa65D4UORp7nF5O87wYrDmj4MwQJSTiBRed
 CzOQRgWvqdI2BJ6FiIX6SwSC/mUyPD8AWCPKND7eqvXNZBcGEcbTG7MUpgOXPIoNwQiv5satZ
 5y1tVGuDAX9NEqPnHOzGd3xLEms2JgejCyKYvOhpcMe2IJoNQNSn1lEtfyijTzyD7kOiSaYSG
 p3rkZDFDtn6HwY5pt+9hVmFQbevMCsxfAs3JDSIpP6wl5snrvuDZD1L9xRVVTUHWKUvAeejwq
 pxYzGsA6xyVa/b9r17Mz2R8P5wgVEV4En9KuBwfFcAgiLyD7nf4S5fUIsGXVeQYrdzsosmEYB
 wLuyyT1ZLbk1hvzKzVYptL1LK3Zixc6t2Xppo5XNrfHxpVzs/2r3sd2WXFBQ4AgvFFzxyVa89
 oe32EmizBmVynPXa7tPQiP5vuX+VbJvEp7lVfzKEbgzBYIaSqEyrwQH6rK5KF0jHhOlAMSQnM
 //axb+wKcQ4pP5FWomid31RY3Q8D0M7vX7YH/k9uqi1WvJn2dLk074xP0AAs6tNSSo81/OmFa
 js2Z0CG7U80McZCwUiz0HDxHYzUd50ye4Khfn3onGaMvwPm+kwNFNvfAJoMZK7UJN73je+qTY
 0KHj3NdoEvw2bnQDQVAXljlIpgiTKwCc0ioZDZaja3gwyJtpjNVYYw9VDfVhEVEZxnKLvmUhA
 d2gaq9iYJhFahUGJYLq/B8zUOmBY=

=E2=80=A6
> To fix this, add error handling to check the return value of
> find_nmk_gpio_from_pin. Log an error message indicating an
> invalid pin offset and return -EINVAL immediately  If the function

                                                    if the function call?


> fails.

  failed?


* You may occasionally put more than 66 characters into text lines
  of such a change description.

* How do you think about to append parentheses to function names?


Regards,
Markus

