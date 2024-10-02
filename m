Return-Path: <linux-gpio+bounces-10712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C83898DA0E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B74E2861E6
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033CB1CF5FB;
	Wed,  2 Oct 2024 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhJI0BdJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093601D1309
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727878383; cv=none; b=fgcY/dJhKm+xgpaj0R9K3hEFP5s+v/lPWyG9UKlHJ8dRsrLNnH5KQWFJ/SKFDJjkSYbIOAcatE209xZb8zi6TXSFvaxPFeZ/LkisBNF6f7ZjoykhlNQuUK8Vah3JgaVfSRPsSiiYtJ6Ih/9NtTGty3C2duBj8x5RIL2TQcXZiWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727878383; c=relaxed/simple;
	bh=/MwprdMA2CplfBjH2zCn7WBpr5tpPa87QKFYlk20vb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hj4Uhi5x+pGSQ4+jLJtJvJf8O+ijs20oXfSYUuXELNL5KaiMtvSSbx0c+Iew+VQWuaTUpqSFgtrMoyi3cs1ANJWiRABhUbvArvI9GKQko5OQ6F2OCbwCOSRAa2Sve3WAG1afiKfLt1BCOyQkB2wlmg7UV91FeEO6aKvC/cC3yQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhJI0BdJ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fac49b17ebso31658881fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 07:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727878380; x=1728483180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MwprdMA2CplfBjH2zCn7WBpr5tpPa87QKFYlk20vb4=;
        b=hhJI0BdJWh2kfrHGRlr45j7lCdLwefeDK0jH7a9C8rlqZM9GeFcJUW2H/Bu6RxweXS
         Vkq2AXO1jhA0vu79wkm1oK/DTVvpP/jZMly0oomtoBZFJ1M8RJ5bwsWEY8DXOumpsZGS
         qyzPrTrktDgcWdv3yrQELLssqYjEziyerkHZ6U8rxKUwh0om4Zj3Jm8HgwLe7JgJm7wN
         yanbGskJ8rjeWi7uot5GBSMPCbYEid0N8PHg7E05tuIhV/bc8Krg98rwJwdoKinZzCRZ
         vLJndRNzO8IwFkWn9eWpGIOZi3VyN2RFzri6Jd/2FG/Dn/aOUw1dhzdJvuSLxi2nvrYm
         YjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727878380; x=1728483180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MwprdMA2CplfBjH2zCn7WBpr5tpPa87QKFYlk20vb4=;
        b=uRcclPf7iBU1yWoLLerf/hvq0DzY4CkQtUtrCoG2VPUIZIT9Pq0S1qU2IxBbvqM5ij
         PL7wTrYiyMdvrxW8B/4lFR6Ne4IBpVaKDuYzW0KcQyuH5W4Cv8g5fQCec5oOVUXqo+n1
         ncM3qLxLVPzGHB0rRnFDIN0BCR5KItA3Zesg+9duoGeuRaTCNI+/BcZ/gOh8YxZHNl64
         PZkMCdV7glFAUmZrraDupLA/KLJRQTHFSIGt8ZD9PZ554k1h+1hMuejwRhdZkoEkB5YZ
         dXtOhkmZP8B5sVYJvu/S6RKU0OAuMaUeTB9yr1DsZ7NZsC6CHykpwb64VkKqMzWC0HVm
         HZ0w==
X-Forwarded-Encrypted: i=1; AJvYcCWZyKUIB7A3uOtjxdgKpQRLSVV2mqRM0YR/qvib7t3aFwCEip+qgn5N7/Vf8S+dtZpJVbYjhoC/TQOI@vger.kernel.org
X-Gm-Message-State: AOJu0YxXvZw4S6f5xB2t7Bir4q00LTk8xzTuYVAwkoCUwm5ifJR7Y5Vj
	2SDSQhZRRkj5kXQMQGXUeRy43BcdJ8+GXmi8Re6AfS8NBZHVHpo52eX7k7BUL38QNMybsq/YQ1f
	xTEYHqAe+ZJoP5kG7s2nbtCaDY8ctqiHoZx42wg==
X-Google-Smtp-Source: AGHT+IGl17gRjgNnOMS/iAMQMN4J8biS0TRxU905QubH8vQVNaxcsist3JF9+CzeIGPLsDpKZ+I+rdokSFbiRj+qXpo=
X-Received: by 2002:a05:651c:210e:b0:2fa:d386:c8a4 with SMTP id
 38308e7fff4ca-2fae103c83emr21489031fa.12.1727878380034; Wed, 02 Oct 2024
 07:13:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002-pinctrl-rockchip-error-modulo-4-v1-1-4addb4e5732a@cherry.de>
In-Reply-To: <20241002-pinctrl-rockchip-error-modulo-4-v1-1-4addb4e5732a@cherry.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 16:12:41 +0200
Message-ID: <CACRpkdY1weM7+iRas0-7ZiWkf2YwH1CrejjWbH0L0soawrhCcA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: improve error message for incorrect
 rockchip,pins property
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 2:03=E2=80=AFPM Quentin Schulz <foss+kernel@0leil.ne=
t> wrote:

> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> If one improperly writes a rockchip,pins property, the pinctrl driver
> basically just states that one in the myriad of pinctrl nodes is
> improper but does not tell you which one.
>
> Instead, let's print the full name of the Device Tree node that is
> improper as well as provide more context on what the expected content
> is.
>
> Note that this should be rather unnecessary if one reads the output of
> the dtbs_check as it would be highlighted as an error.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Patch applied!
2 hours! Record time!
But Heiko was there to ACK it so why not :)

Yours,
Linus Walleij

