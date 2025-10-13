Return-Path: <linux-gpio+bounces-27013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D05D1BD2858
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B96CB4E5D4E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 10:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B5D2FF141;
	Mon, 13 Oct 2025 10:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOYeIodv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CE21B394F
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 10:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350731; cv=none; b=i7Q0sBhbb+FK/mazYJM4JUpEFj4lt5X2DGV6C9ThgJsS9o8DzOjkGxIKBIdghK7Tje7Z4oRDBStl/BAP5MRoz4yHb1t9HDVWs07FAg4+xGuoQ3rGxenJ+1eigTUcd+uQzCRjk5hxit0dQLLLwcVibEPkYk71c6tuPQBFjaoIAPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350731; c=relaxed/simple;
	bh=KFlkKhsToSNiIVYTfCINycSlYKnfIJUcU3TZviU7e8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/t2dlZIFm9Yp9+tVpJMBWMyIPEa4TuEvC9bCAFkvB1qBI4uvewupC7ODIapMguxsBDPZyfbbsN9EJlUk3HFoheAL/BrM0Dfu/TMD4CQgPJn3zuCSijb9m4JSRzHaR5xJGNE3m1tLdJOW8Z8HOBLtBWvA1o0nRlpADir0v1Vwu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOYeIodv; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-58d29830058so4950170e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760350726; x=1760955526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFlkKhsToSNiIVYTfCINycSlYKnfIJUcU3TZviU7e8s=;
        b=iOYeIodvXtyaDUddlGM3xY01yXtcs4HazKQJXzb7o04o2e+Kpc92Ho1TVxyKcXNhFB
         eOau02nQeA7e1WlcsHmrBVIUA8efKRqzGfzkUjMnPCjv2FBSPWOZyHlGs0bVCVkmg2Mx
         kK7T16uivR7cXXl4Y+H0zQqI0vySyTNuLZAPSNYweaS0MqUkpF6dsCsxFgsRqUKwCWB4
         4zoFW43ef7+wSOMasn8lqZKpeMWZBcx14JRNJoHtt+aUiTSuiVms05MQWNq/AxYQYEyw
         aQ+ft//IRDU2OXVJQd9cHvgmpWMqjEK6b3leILKyem3Rhg57l3ieCIys7lEpeHwQE6FI
         4sAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350726; x=1760955526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFlkKhsToSNiIVYTfCINycSlYKnfIJUcU3TZviU7e8s=;
        b=fEeZFu+7m9wpi8KOFwmvBmSKy/FrYQetCrs4xjXLc+sjm0Ix9/MDcekB3KaP1KVXWg
         jJpRHmXMFBwdaPy3J47Q2JvtCJ/yltBa/Cj65ZyctAk0qiu1/E7Ndoc5u8WsX3wkXXZp
         3WPCt/WTYU0RPZucdgp1EMhIKQAgGX68bi7BpyGtg5sAfJtMbBs6ezzo0Bcu6dFzhMZH
         nAijXVA9Xv4Te4OULk/Yo/9wrcWzZAG94iENzNryU4C/NIMFWft2NYBKJZYZm9EJX69d
         v1zBLDWa/LAIBt5IPjjc/BceFaAFYBa51698HQs2ZvTKUzKG4AV2lDmJZbpU8Ghz+aMQ
         pgRg==
X-Forwarded-Encrypted: i=1; AJvYcCX959IFR7IdAMy5bH03nxCXhUjxCTquzQc0Os2nb8ow8Xn5xfyV7FkQJpugzB5eWiTveg4nWcepKGuc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqh+QckWWjDU4Ly+iYjJM+a8oysYrc2oxfxtANqViFRSJsFeR1
	3wjC7sfQxYR/Y5ttQW07Ws/+Q5BZKGX6gc73U/48WEFqLWubFGdhd+yMK81qjpt7OI4krIoBDd9
	dqi6UnKOYLHT73AW3/McaCWa6kd4YreNX3ARNmMLYcAyJ3KTIQV79
X-Gm-Gg: ASbGncvMdRCaVC6Bvwouay2rhkAxEC6SnFowE5EQTD4MsLCpHSWKNUh5hWpQKXeEnlV
	xGj+JbKwCnO6MEphVSvhG3XbxYfCHO1IkYFP0UOJIaQvcs5SMpwI3ZPXkJF9jhwT9ljsPxEdpNP
	3TnB/ePiaiJBErvajc99ebRdhJg1ZifsgMYxCnsIDTiauVInaSUmWzFgTe22u9KC1QXU7Fu1jCY
	8Wp5rumZCS0zi85mWA2aLtGYTPbsSkpl4q0Eeek
X-Google-Smtp-Source: AGHT+IHH9tVr2y31C2s758P1Y1iCzf5CBBO+mUKp+b25MmlZjZZyEk+h30As98u2vagbtvUMjxHrZsPQPtd3jW6D2mg=
X-Received: by 2002:a05:6512:3c87:b0:58b:23e:5ec with SMTP id
 2adb3069b0e04-5906d8e5b43mr5753879e87.26.1760350726407; Mon, 13 Oct 2025
 03:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250921-msm8960-sdcard-dtbindings-v1-1-5a2455a30a06@smankusors.com>
In-Reply-To: <20250921-msm8960-sdcard-dtbindings-v1-1-5a2455a30a06@smankusors.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:18:35 +0200
X-Gm-Features: AS18NWAFBvRQlnNgwdeWFM-KX-enH6YfuOQVQqYG2hxpjoeevDbWK0MYvNQNYmo
Message-ID: <CACRpkdYJPjf7VX_b3u74UhNQz-kTzmvEkdo-YWYNn9fF7+T0ZQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: msm8960: rename msmgpio node
 to tlmm
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 21, 2025 at 5:26=E2=80=AFAM Antony Kurniawan Soemardi
<linux@smankusors.com> wrote:

> Rename the GPIO controller node from "msmgpio" to "tlmm" to match the
> convention used by other Qualcomm SoCs.
>
> Suggested-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
> This patch was originally part of msm8960 cleanup series [1], but as
> Bjorn pointed out, dt-bindings live in a different subsystem and should
> be submitted independently.

I already applied the other one, but thanks!

Yours,
Linus Walleij

