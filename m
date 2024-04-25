Return-Path: <linux-gpio+bounces-5849-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 710008B219C
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 14:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88BD11C229FD
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 12:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C9F12BF31;
	Thu, 25 Apr 2024 12:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n2elBBFY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2EC12C47A
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 12:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714048160; cv=none; b=htacAAzwSl0OT2DnJcalrMmuGFN4G55WbD2Hja9bhLZM4SgFpXS3tpfXgUSGgu3TIPIuwNBs2PcMiMD7P4vSmm9agIHc+wGfV4W1RfEdOOgj0cfscvXsYXlx1W16mP0owtXQOH13++Y74NmbRDdw7cNB+bN/4spvwM1S+H+WBuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714048160; c=relaxed/simple;
	bh=yxk0HR9ZSzYzouNNr1W9sEQ/oMJwFcBaF9BHsEWS3YU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5/XyS3xFT/1pOZHUwgojsAJVyoXZpLC57t/AmS29ZPYAJ3TEIXNz3XMbF6WMMeVjw6bm4l+YKyG9e7YyqQ8NYM2Q1oYuJyT4xQRpZgLnoRTB7uuMcfWEt6javiNU6QXx5BmTPqwZQIUjeZrx2ZDyVMnDl9ChnBp3sQmwbyz3FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n2elBBFY; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de462979e00so1005693276.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 05:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714048157; x=1714652957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3phw4GwceAPncOaaaAM8gjCjiw17W02CWykkCKHn3to=;
        b=n2elBBFYmvi+eQCJMlqNQ7G+5R1obdPXn8U2PsspjBHPTGX8a2ShTAYeABdfm4Q3mC
         iH0fpgSGPQwhXkPlyZ9TJLUPpTAR0k1lje0PEyYqITRN6IMDqaU0Oz4HKTh/CGCdMpiU
         cQRJqygPzfV9aaiQGfnGseZCCFArRYZKOWlSfuHnCmkFYU63ujuvLujCtHm+7Ce/SwM8
         /mJ38hN0jVMTYbbEhiKqM3/EHiGSIN/Zo7/sc0b8GSNYMVXzietTH4YVth43It+GHKXn
         9jo116n1ZWV29NeVuhEYm876L/trWOgsgomh+5Syj8zRaREUq0plk/FjAMC3Zk25D9uM
         n5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714048157; x=1714652957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3phw4GwceAPncOaaaAM8gjCjiw17W02CWykkCKHn3to=;
        b=hfB0KnPTf8yZQVDu1AcZhqSH4mjLmD2atu0q7icTFbsV30aXfwFjyPCc1Cp7YQ9OVW
         VoZuHFLq9SLJNWfngA81hS1n+IB6jiuUcoVV4PP3si7boefAQZHzT9AfzIrmQZ6WGKQ8
         EBMNhrEm586ZLytKpO9RPELMtYTZPqE28bj0q40sPADuKb6idLmrvNO4z4vMNHW0FgU6
         aOEnjTKBoyTyD2nVLI39bo3ub4rpxn7MGPd8OLLGe/3ce8Lz0mWyg26JW2TAu/2XJ5DZ
         5ml00tagLx9Nlo3vnaLA0X026t3t+sIQfXVbeBU7B1aJBa8vI6/N1KrQBStojhHPvdH5
         37Tg==
X-Gm-Message-State: AOJu0YzeRRuTBcpy6f1AOwngpeE+LLB3o8J8PUBP45Ui5gzNkMDOh97h
	Y2hA98tFKouIVS0KHR47PNMsY+1bih0dO0SGOLq2cIr2yOZ9DN93KhibYY55b1o69/7vvK7lCH3
	c+psWCpu9OVyv35/5kFCHSCa3FqABUBO9xI9SkU9NGFtsLdZ6
X-Google-Smtp-Source: AGHT+IH3uW6Ai+q+KnWr2xUdRGCAouBFp8Piasv6KvVaPSOP1DPOuo5QJccbWtCAlEd1gUqApm447y8ev9ZewP5hNeQ=
X-Received: by 2002:a25:c551:0:b0:dc7:4b0a:589 with SMTP id
 v78-20020a25c551000000b00dc74b0a0589mr6785399ybe.55.1714048156993; Thu, 25
 Apr 2024 05:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1714035703.git.geert+renesas@glider.be>
In-Reply-To: <cover.1714035703.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Apr 2024 14:29:05 +0200
Message-ID: <CACRpkdb0u2JhiRD5g3thYPreMLPAZd_5xiLgjcFHcBbSuxcPhw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Fixes for v6.9 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 11:04=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit aa43c15a790cf083a6e6a7c531cffd27a5e1fd=
4f:
>
>   pinctrl: renesas: rzg2l: Execute atomically the interrupt configuration=
 (2024-03-26 09:42:37 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-fixes-for-v6.9-tag2
>
> for you to fetch changes up to 02cd2d3be1c31a3fd328ee83e576340d34bc57d9:
>
>   pinctrl: renesas: rzg2l: Configure the interrupt type on resume (2024-0=
4-22 09:54:00 +0200)

Fixes pulled on top of the other fixes, thanks!

Yours,
Linus Walleij

