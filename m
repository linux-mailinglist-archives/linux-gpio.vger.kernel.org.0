Return-Path: <linux-gpio+bounces-9837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E897896D9DA
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 15:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 874BA28342C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 13:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BF083CC1;
	Thu,  5 Sep 2024 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nJtuxFYq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4508D19923F
	for <linux-gpio@vger.kernel.org>; Thu,  5 Sep 2024 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725541739; cv=none; b=DJRVYjk2RWp/61WlsZhMrM3pxWJBB0AjqdKUFBjG/FwDElqq5jsCDSOehyoSBDZoBkyAd9xLhyzw+rdHZXJQCdFdxGfwtTmgcRDPA7tHu/JmjVbAiIn0PGlLEsEOjlu82bobKhqfr31C/WR0YQ+xIOm7oYl7pUKokwQLiaecx2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725541739; c=relaxed/simple;
	bh=f9N4xrTTes+g7/U54vG6V+6L0L1TrCM5nN3Nv7eOD40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUUI9tOuSMUrlShGKA5YhalUM9P8JSqAYVfcQsWtpK/wPkAjfduZdnVrXG5Gc1Udg1z3nKQzlBiJpQ9DYmDYulYccLuQEe9ZnO50PBNdrM2Rl0yXenNsy4gBoOP2aMipCxmtMDA4Ye4w41cI/QXPFUUR1M8YVOdcfrTCzmB8n94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nJtuxFYq; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f401c20b56so16747651fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2024 06:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725541735; x=1726146535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pneB5MZJo622qMiA84d3oB2fd0IWKTmHmFHMugfOKGk=;
        b=nJtuxFYq9NPkSvRf39kp6llSmlXyaPeAH6ndgRILSTNqO7Eq23UxbnAkkgxiqVJRe/
         +d/nfbHzAqXVX9ayf4kKlo9xEF934gQ+n+rFRjxmX9uuuJEdzYyjnc7O2UKEGSNO143S
         Ma/WUOtvaF45qGqZn+TG6hzjQakiWPkdsXY3AMX1Ll/xFmxXK2VRBVB3LwcKp9xv0ZPR
         icAFUpwqWqK9t6RpnzEVv5Z1uWY3QbYjdCxJSxHZgdTSqReGBC55t2ZFWu8nOONH598L
         6nVtLT10SMukMDAMgGe2mUdnGhoyLlCKSAtEpUN7tLzAN9roYc4VCWeFAohnHIpgS6VM
         9mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541735; x=1726146535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pneB5MZJo622qMiA84d3oB2fd0IWKTmHmFHMugfOKGk=;
        b=hPKY3qHnLCIfqUwsg5He5Wq+TlD8oQyeJYgiDdJrGK5pJyVQZOsL7LXPwG2x2V97xD
         rqE563vcQEM+zFnAWoF43qfJdMLZsVEwxieZXG+kvxYkn9FmmOAeXuy90uVcHLprmBg4
         VIgvGgFfMyRA4HcKIdZDTO0JhRhTkq8CmBt280TLVfnbIRk61IMssXmpR8uBC1fbuLKI
         xbqd9trjFEq+TZdGn9DlvB+UFLdeIq8qGQzoR+9NXwnKdpzLkJwoZ4IjiqOUp33qN8sW
         /5d7y4QBf4Ek04aW8gUo9LtcQ/g6+4vYD/BINdY/FBEorHr+Sjwdwv9NxLu4fSC1n5sI
         URrA==
X-Gm-Message-State: AOJu0YzJIF/Am7J6+ecTa9aJ4/Jsb3myhpRHXoHQPAVsnuGFran1C69u
	DimiUiVAfWjDiJrHR0I/fOrSXeJ8sy2WyKau3YIKN8nG6m9+uVsQK9DDKOQJagrTMd13V8zcR/L
	K63O/3LV6FQcVX535h+S25j7en2fiF5+ccr927g==
X-Google-Smtp-Source: AGHT+IFDB+SQJUcFHIcGLBtUAOQM4sjWL8eQZL09m+CyJVfUaqz9ywFiYDlcdoeQwKx+jer8WTrcghc5W5KnnXyPtLs=
X-Received: by 2002:a05:6512:3ca1:b0:533:4613:21be with SMTP id
 2adb3069b0e04-53567791065mr2156474e87.18.1725541735090; Thu, 05 Sep 2024
 06:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1725374961.git.geert+renesas@glider.be>
In-Reply-To: <cover.1725374961.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 15:08:44 +0200
Message-ID: <CACRpkdbtB_MbxdiVM-V-CsBvKah2Mv9h1o2KmoZ0YCwZLxxrcQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.12 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 4:52=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit f73f63b24491fa43641daf3b6162d2a451bd84=
81:
>
>   pinctrl: renesas: rzg2l: Use dev_err_probe() (2024-08-02 11:26:03 +0200=
)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.12-tag2
>
> for you to fetch changes up to 1325820dd085809645bdd89a2fd408a05b4a5492:
>
>   pinctrl: renesas: rzg2l: Move pinconf_to_config_argument() call outside=
 of switch cases (2024-09-02 10:13:59 +0200)

Pulled into my pinctrl devel branch, thanks!

Yours,
Linus Walleij

