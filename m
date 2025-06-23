Return-Path: <linux-gpio+bounces-22015-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 994F9AE3C19
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 12:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1382E1893137
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 10:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D9823A9BF;
	Mon, 23 Jun 2025 10:20:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5D923ABAF;
	Mon, 23 Jun 2025 10:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674044; cv=none; b=lJi1EGzEPJtAP3DVTTqINeUOXKzxnzdPy11L5WSRSdFFMnOOpZy3K7hCB7XmEoD7n4FONn8AvIZSthcQXY4S5EuQr3PsJMKqUIUDC3anwpm6k319Jbto8tQMv5kd+22DARfRUbPurItEt7NSPb2RMLTXp+x3PP1GvxNqCgcnX+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674044; c=relaxed/simple;
	bh=2O0ASG1tgknCDrBskU1uAOjJnO7GN+XCNByF6GVWYRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hCP+T9iaeBYiRSo+z6kMFrFm0tWdeSSo43OFPg5SxtexG8pi0tIJemfGMSqGZu2UqFoKP+k7TNc0OWMgGde5lWVRGrhE+u3+r2g24RqDnnP/+1yJgf5kOxT+4yPzX/Cu0c+p4JNlrvSAFB5sFEgX6BRsbpCTtxUxxJ37BxnGm9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bQkGv3dTSz9sp5;
	Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCJuaHhYGyDk; Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bQkGv2shGz9snk;
	Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D0F18B764;
	Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GRsg_LSFRtsh; Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
Received: from [10.25.207.146] (unknown [10.25.207.146])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F91F8B763;
	Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
Message-ID: <f527c6a8-faf2-45b8-81f5-03def802e485@csgroup.eu>
Date: Mon, 23 Jun 2025 12:05:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
 <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
 <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu>
 <CAMRc=MdYuk_O3P1QtepvF-6m01jn3xpDP4YxttQSp1-J-J2GvA@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAMRc=MdYuk_O3P1QtepvF-6m01jn3xpDP4YxttQSp1-J-J2GvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 23/06/2025 à 11:55, Bartosz Golaszewski a écrit :
> On Mon, Jun 23, 2025 at 11:54 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> Hi,
>>
>>
>> Le 23/06/2025 à 09:33, Bartosz Golaszewski a écrit :
>>> On Tue, Jun 10, 2025 at 2:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>>
>>>> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
>>>> values") added new line setter callbacks to struct gpio_chip. They allow
>>>> to indicate failures to callers. We're in the process of converting all
>>>> GPIO controllers to using them before removing the old ones. This series
>>>> converts all GPIO chips implemented under drivers/soc/.
>>>>
>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>> ---
>>>> Bartosz Golaszewski (2):
>>>>         soc: fsl: qe: use new GPIO line value setter callbacks
>>>>         soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks
>>>>
>>>>    drivers/soc/fsl/qe/gpio.c       | 6 ++++--
>>>>    drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
>>>>    2 files changed, 9 insertions(+), 5 deletions(-)
>>>> ---
>>>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>>>> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
>>>>
>>>> Best regards,
>>>> --
>>>> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>
>>>
>>> I see Geert queued patch 2/2, who would take patch 1/2?
>>
>>
>> It is in my pipe for v6.17 but if someone else wants to take it I can
>> Ack it instead.
>>
>> Christophe
> 
> No, that's alright, I just didn't get any notification nor is it in
> linux-next yet.

Don't worry, it is not lost, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=&submitter=&state=&q=&archive=&delegate=61610

