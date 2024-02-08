Return-Path: <linux-gpio+bounces-3113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB5984E23F
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 14:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF3C2281B01
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 13:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A338F76C72;
	Thu,  8 Feb 2024 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZN0qOwJm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A08768F3
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 13:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707400009; cv=none; b=iGI3+ImQ/9zKI6wi+Fxa1K6xzE7a9PzawsY5I9OUBJbDwC6+XduDX7a76UagBj/FvegMte+uTMcK5d7PMaEdQ3++ykqGYSHqjWplrHBwPJn5wa4nPIN4Ykppzli11jPimbddMMMB2OZSMDtWTCPOW0lpB47DZs9AorGNfRU9les=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707400009; c=relaxed/simple;
	bh=qCVhFVtPC5tbl66HtqtFrAlZz3ol3WalO+JusmTAcyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBLLFu7x0LIGpOiIBhKR66FCd7nXayV7skar44PZMJfzl7Ecg3ZmsxXz4eEh0gV7nf6xjN1DBuTxy4QyRx2927kDfm62LeGWzjNXMCUFDnW9H+PmiDS/0NdFtUZkx/ComCit3OtgQe48qjCA3Lxt2IFpRWq+kHdi6cF6xFISPrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZN0qOwJm; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso1600229276.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 05:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707400007; x=1708004807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCVhFVtPC5tbl66HtqtFrAlZz3ol3WalO+JusmTAcyY=;
        b=ZN0qOwJmOLvWTEJ/UWk8Jn9oOh8uONsiiaSfqQQvpehSoaXG3VWqobRNyImqCcuAZo
         VnNAvPMXcyYxHBeMvNo5B/WQ+qmT62AT7IN2YNZf3VOCPTH+Zmo0IKtWH0JHLnjR1GA3
         IrvMhSP1p+Z0p/wp832+0vQ6FOtcpAcb6kNqFYaC0uPL9rUMcTQEVKOCXf9QKptL062C
         5S/csN4yNSqolv/+6CopVcqedm4Mb6VVYiOxowy/73aOhe2JocDXgpDN1FABdTriACSJ
         T6RrobyUTQqpvRP7NPSW150Lqe10XA98QXquShpST8q4vKU6mHzPEAQYubAZVG5/j1PA
         RrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707400007; x=1708004807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCVhFVtPC5tbl66HtqtFrAlZz3ol3WalO+JusmTAcyY=;
        b=b6j5bGmUUtZEurf7olfKg6EBuWMNmjy2S1pNNSu3ui/YHjiKDH1yHqQsUxAjGu8pHA
         CUnKu212hSUMaYVarkQxfqFUUNv+DzVcnvtkrTV52sa6tKNRw74zgOvDXOjJ+s2FXd6q
         eYbQzSrdivdjvS83pJSL1a5UX1xpiNCrpWT3lj30Fbyv1s7Xo72KEqsC6y4y5ObpZhVI
         FrjACYlAY8vHbbvFl4EmsXzerwECZ6oNEfvZ6fnpvL3D2IhrN3DiYtiuF4izp+1WfDQA
         VshSPV5/Ub1AEgyGceUcLlEOsJobUSBdsILwnZ+TnCWjSV7k9OMhRMz4j7km4k3hzxJr
         Jv8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQad2EDKMPRsP1hAErnFXpKnWwsCOpkZwSDaom0oGw912RvJ5Nvkg6YfMR1Fmcj3yI0/GexVYoo3gSDAaoRpWADt/xqLd1pdrVUw==
X-Gm-Message-State: AOJu0YzlKY8q0Cc84LmJqG8H27RInn2AnBc1j0NtCUN34zrOow/QFUnb
	lvIPJj6hgwO75r8YfDdjZI3IerbKd1P9vx4vIvxr7zuZFKHTALd6vLxWAU/CE0olobmmnXdR+d+
	7H+zZI9Czur0Kh6I0iN0ED5W3IQn97A3WEjuGfgxt1xUfID5YUvajqg==
X-Google-Smtp-Source: AGHT+IGudlPEl6/lvKujeI4dp5nYTC7DGljHLLRLLV91qux7C5p+u/hDiKcrt2xWwb8aTa7LUTk2zQ6teOWNlj5s5Yw=
X-Received: by 2002:a25:2985:0:b0:dbd:7491:368f with SMTP id
 p127-20020a252985000000b00dbd7491368fmr8246474ybp.7.1707400006818; Thu, 08
 Feb 2024 05:46:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201141406.32484-2-arturas.moskvinas@gmail.com>
In-Reply-To: <20240201141406.32484-2-arturas.moskvinas@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Feb 2024 14:46:35 +0100
Message-ID: <CACRpkdaftsHBW5uJe4WkQRW1+YrdROuVewxDTfzVKoz9q9ZyqQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mcp23s08: Check only GPIOs which have
 interrupts enabled
To: Arturas Moskvinas <arturas.moskvinas@gmail.com>
Cc: biju.das.jz@bp.renesas.com, akaessens@gmail.com, 
	thomas.preston@codethink.co.uk, andriy.shevchenko@linux.intel.com, 
	preid@electromag.com.au, u.kleine-koenig@pengutronix.de, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 3:15=E2=80=AFPM Arturas Moskvinas
<arturas.moskvinas@gmail.com> wrote:

> GPINTEN register contains information about GPIOs with enabled
> interrupts no need to check other GPIOs for changes.
>
> Signed-off-by: Arturas Moskvinas <arturas.moskvinas@gmail.com>

LGTM, patch applied!
As Andy points out, the commit now links to the discussion thread so
people can find the details if need be.

Yours,
Linus Walleij

