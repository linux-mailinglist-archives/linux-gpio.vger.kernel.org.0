Return-Path: <linux-gpio+bounces-21047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C0DACF02F
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 15:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8DDE3AE810
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 13:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A06322FE02;
	Thu,  5 Jun 2025 13:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URyF9kk3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BF822D790
	for <linux-gpio@vger.kernel.org>; Thu,  5 Jun 2025 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129442; cv=none; b=jB84Th2+skBy2LhLvEkxkmug8yFIgv41W6Z8ngORn+JDYlIdb1dpR4WFrp17eEMPuBgolMPWOxraoj/Pda/1SP3P1x6gHZzO6bVl/5PC0jVivqdmuNiHjhVwlOog1P85je68lwwCacrpnbWhX7/oD4yHJUG7CMenEnKWOmQp3eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129442; c=relaxed/simple;
	bh=JYxfNLUhajuZaDRRmStEgps44e1RMYkmRRzlZU8Wqi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pS3PqKLqTg1CYijeaeKFCvITqy7FGqNCmh1bY/H47FbYeqrvD+Wzej+7OrHayVWiFKlaHnReRM1SvE25YzDPXLnF+TyjoDGXLvalttVyXT6Tc4Fk+/s9upfcEjE35sIgwYMlXA3+fWp21RSYML0dlKqup/xmRVcaVsDF0rO8P38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URyF9kk3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5533302b49bso1064497e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Jun 2025 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129439; x=1749734239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVRYwEpnZ9G37QC8CdeQkhsKUCGJDds8q+iTQKaOrS8=;
        b=URyF9kk3Fsb2DItj67bfO0zdxI5KbRZASQRjGUMIVVTZcphQqg58YNuZXG8AZt2eio
         z1R0ax5Uqcl3yvTut5nSuIEfGQjJIkAGvv+PHo1IKqbjXLlMMjJ7EAwxj9fAirZI2XOm
         9ZIrUloogH0Rq01bUWiPEEFCntQ1fNZFF7EwGfTT+YCR7VqGw4ntxkmRuiNHxIc7Wr1b
         tBZruTjNyobTPyQxCfuYgJ01TVowcc6C7aSFj2W93nYLxnMCHLrNMxhFRjEJqP8+o/mI
         ElCyawQKY32esnOhFod5P9DVPJB/6Na2mR1l3YrpgkI8D5jPuQ/JyuKccQjMSFrGAo4N
         TWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129439; x=1749734239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVRYwEpnZ9G37QC8CdeQkhsKUCGJDds8q+iTQKaOrS8=;
        b=qmOTb8k9dwWykfVHP8tksavNBeAp5b1aOOK9sSTTDK3TKOAir0F0T7nRmO3gJkEFBS
         Yz5AwCk4vaECeiTi6YPKsIm6ozLrv9lvBfy7qZfJNQmq2f0cVgsPx6/rBR33jXy2X9nm
         QJswdojMJw4quPCH3UlXNQ0jxrjWb2ZcKE49k+kKmigcPCuqMwxxTnSG1Z/I26Na0k0o
         tAsmR06oVkzOlS0bYLWcuhf1+9sR+qFHedxLgETF8+INkLYZqvhDeiOnYLxX3xmF9Xaf
         6/lQHyeKrlM0WbKlH0SVvt1snYHK29zhktu2AeMqXfVNdUfOGGTVk7OLO2HDU89dX/DX
         goLg==
X-Forwarded-Encrypted: i=1; AJvYcCUcsbA4HtcHNqHwosDqar03ygOpfPtkHgJmcV+sGVSsfmooU97JTV02jJaFb3jGeO5Ebmqdkx/jtvIu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4LfbDxiXMCnpDYuJoQp0AQY5jawzWDG7XGedUk7ZlwrqmGt4X
	XDRl0ZXGizSaf2YlArsGFEQsxcy585b8Yb7b0hBsqUQK8P5Yl/VppdOSPTiMl/tPfr7mfJP87gc
	p8SFs2eorZLgIZD9L6GclH2vaPlGQ0VUY2Cy6Ai1mtg==
X-Gm-Gg: ASbGnctDC26aYD95PJcl1ZowP2oHZRUbqYtownBeTF9zODpbqTrhlZZttpDydkHUj5W
	cErHgkhIO8DZq6LVB0bEHNyb2qO4yiH+yD0j0FDY7vax9PONChCi9KMWt9hLGI7WHFNQ4tuIu2e
	FhkwFH9NtBH0uyrFZqFg4FUD77fK7wlPr/UBNsZo5NJBE=
X-Google-Smtp-Source: AGHT+IGSwgYnrvr3g8aeRhiSjVHFD+1gNjjWAA5+wUJMnF+AzDSh1sGl53H+1ztLSXhG3Ujo7CEKSbOVGk6DthmnUAk=
X-Received: by 2002:a05:6512:318b:b0:553:2ca4:39e6 with SMTP id
 2adb3069b0e04-55357bd6ebemr1929113e87.50.1749129438604; Thu, 05 Jun 2025
 06:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528104514.184122-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250528104514.184122-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:17:07 +0200
X-Gm-Features: AX0GCFsyHTy0xHTXMQQJYfVcsI20tWGrSxmyCezmfvwpOnDjuZ5_vrh0a2YdFDg
Message-ID: <CACRpkdYfQYzkU49eVhaWB9M32yTrCN_Lr6xFte0bSM91t3z3SQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: MAINTAINERS: Drop bouncing Jianlong Huang
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 12:45=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Emails to Jianlong Huang bounce since 9 months, so drop the person from
> maintainers:
>
>   550 5.4.1 Recipient address rejected: Access denied.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied for fixes.

Yours,
Linus Walleij

