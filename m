Return-Path: <linux-gpio+bounces-22014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B09AE3C15
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 12:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B3D7189325E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 10:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1539E239E93;
	Mon, 23 Jun 2025 10:20:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77DC238C27;
	Mon, 23 Jun 2025 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674038; cv=none; b=H/VjfC4HODWrEydKgMCpdwgbNMNSCYoWJay1zrahpwxJ+J9m7OAKp4kqzfBddoZYR/ALZ6MxUTcVBojl9gNyuopsUYl/iv5Piqb1jNTsj92WiPUOaX07Pu7HLOHGB8+pRh58J+pLw4Mc0jnBXBTeL+mEuWmD+YIoa8Do9G6CTj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674038; c=relaxed/simple;
	bh=p8PQUdRYWUOPl4Z/9qK7If5y4/ivYQHU9/Nwzq6Obcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2F62AfA4KYWR//0NsHgvvFK1Y1pdrjL94e9zgn3ZotLnITqItE8JPJ0paYMmimXqROmbmv7W6AoVps+dOgR0kYJr/pb79bCRtylBavBFgAD1yN7yD5786TZwFTcVO4kCeMHJxtF23tl0tdZRdyZih9Xyhw38zRZmb3M75waYU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bQk294JMVz9skH;
	Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2L25sduycuWc; Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bQk293bFcz9sgs;
	Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 743568B764;
	Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id a4DFXxeF3oKN; Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
Received: from [10.25.207.146] (unknown [10.25.207.146])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1FD2B8B763;
	Mon, 23 Jun 2025 11:54:25 +0200 (CEST)
Message-ID: <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu>
Date: Mon, 23 Jun 2025 11:54:24 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>, Qiang Zhao <qiang.zhao@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
 <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


Le 23/06/2025 à 09:33, Bartosz Golaszewski a écrit :
> On Tue, Jun 10, 2025 at 2:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
>> values") added new line setter callbacks to struct gpio_chip. They allow
>> to indicate failures to callers. We're in the process of converting all
>> GPIO controllers to using them before removing the old ones. This series
>> converts all GPIO chips implemented under drivers/soc/.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
>> Bartosz Golaszewski (2):
>>        soc: fsl: qe: use new GPIO line value setter callbacks
>>        soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks
>>
>>   drivers/soc/fsl/qe/gpio.c       | 6 ++++--
>>   drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
>>   2 files changed, 9 insertions(+), 5 deletions(-)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
>>
>> Best regards,
>> --
>> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
> 
> I see Geert queued patch 2/2, who would take patch 1/2?


It is in my pipe for v6.17 but if someone else wants to take it I can 
Ack it instead.

Christophe

