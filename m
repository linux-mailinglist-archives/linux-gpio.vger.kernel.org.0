Return-Path: <linux-gpio+bounces-6671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDA78D020C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0C5D1C2137F
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 13:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9B515EFA3;
	Mon, 27 May 2024 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B38+Y98K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB361E893
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716817448; cv=none; b=mQ6YdKQ2NHw9Saw8b2CSya/mMt89Ecg4GabCT5AWWydy99vHxD/xYGNuC559UinD75DQakHjusazUxlHbZMVuu/tR5USjPwEPBRtFZ1SMyfn4/45Y88nZE5qBm/elO8eXjt52isVqcQv/pC9Rjo7oB1yv4upeSnABSdgw9sMMTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716817448; c=relaxed/simple;
	bh=xC0rMsBfc/v6Q75/1SSXM8lANe3fe2OjXkC+R5uz5t0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucUtLS9GhhCckMleXwecRLhVsARfDB3PifPfGqucppM52Q8HlWRqAAL7X8GoWkCST8ij48acbxOoA3IyusOweuybsSWGIptxtKAKM0TY2dDc9a3vZuP3WDZRaOlKFW+S5H+OQNeustJKFVIGP7UEwrZvMk8ijRexnVwoG6/rqEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B38+Y98K; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-df4dce67becso5579375276.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 06:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716817446; x=1717422246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjIOAA6f8vKpkTNIxYlPLCqq5B6g/WubZZM52K6hpRU=;
        b=B38+Y98K/ykaKAveY3tZ1XmPXUyHPoTQ7rPBTFeeoeLPBiD1vb1WkMq35fVlIo665W
         MWWsAgdgtoXmrEW97dqzy98G83SiBTMvPAzAj/j/woFrU/f673Occmot///2WJiTh1QI
         kGMM2VJDJJIvHhsFLzUmaoizbTa5qU55grpl1gI0O1CW07FCOoLHHNwcjkGZpHzr9+yn
         JkkZvRN7i0TnfrfH36W3pT0NB3KbupXiqIxqUHhA07BlSJbVp/Hufmqku/tGxuD1WYW7
         GPvyFXwsleWgw9jiGOfBGp7QBkcGeqOCvxxEOws3ZIOb1bH/aD0FC5gnatqHST6pO7Jz
         10RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817446; x=1717422246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjIOAA6f8vKpkTNIxYlPLCqq5B6g/WubZZM52K6hpRU=;
        b=J32SY1x2s3asmiCxbqoxR9bkZd0T1IjrqADo6Btdmt5+rk/xaumT4vJW/ubT701wmF
         D/IqEtf1iQGDfu1qZaUs9d3ML+RHXVKcALmZBhKl0CPW6ix/gRg/WoWntLsCLVw4wH/M
         1YWj3tALhu8SFKat1eeI3PS+5JjQ+7+kClfbw4PueFQXa1fHxX2kksCfC/yW6OR0jKZ3
         eByWjV/LKOUoNVgDuna+1k7g4+EjiqKCLn+ELFioG7+jYTpq/A2Mo3LeTJK0Kdx1hnYR
         yuMr3owkp1glrVdQllhVYrmBGMswqgZUg9d/IYXqGofJR58+1mYmCZMO8gYgyBL7d1Wg
         enUQ==
X-Gm-Message-State: AOJu0YxFaitCrCje0IVi+XrMzhybLA+BTXPXcIWpaPBIdEx88aPs4d2K
	TA4AXRKwZeYRNyw2LEn6Di/MLTyAGB/enFfCj2xfFYKYiK+tl/RYJ0rUsPvkw97iHjXvCgmdjVX
	N4JJS35qAqMO1qh0s2cWYx2oDMjPkdm5dyXoz7osBOvNRQS9CV7Ljiw==
X-Google-Smtp-Source: AGHT+IEmdednX66G4yc6NfcpxB2AnEfEXaBughw+ikECCE023bpfAarEUu73fl8FtrlMCXr8PprIFqLNw62ozoIj14U=
X-Received: by 2002:a25:69c4:0:b0:de5:9ec3:6475 with SMTP id
 3f1490d57ef6-df7721e8ec4mr8443108276.31.1716817446028; Mon, 27 May 2024
 06:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1714049455.git.lduboin@freebox.fr>
In-Reply-To: <cover.1714049455.git.lduboin@freebox.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 15:43:55 +0200
Message-ID: <CACRpkdaM1pxweCPmhg5iQKgVVYBij4fZ7OUf-HRKvPeBJg49uw@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] pinctrl: core: fix untreated named gpio ranges
 in pinctrl_pins_show()
To: =?UTF-8?Q?L=C3=A9o_DUBOIN?= <lduboin@freebox.fr>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 6:26=E2=80=AFPM L=C3=A9o DUBOIN <lduboin@freebox.fr=
> wrote:

> This series covers errors I encountered with the pinctrl_pins_show()
> function when dealing with named gpio ranges generated through the
> device tree using 'gpio-ranges-group-names'.
>
> These errors were introduced with the original implementation in
> f1b206cf7c57561ea156798f323b0541a783bd2f.
>
> L=C3=A9o DUBOIN (2):
>   pinctrl: core: take into account the pins array in pinctrl_pins_show()
>   pinctrl: core: reset gpio_device in loop in pinctrl_pins_show()

Patches applied for kernel v6.11.

It's debugfs so per definition no regression, people get to test it
in linux-next.

Thanks for looking into this!

Yours,
Linus Walleij

