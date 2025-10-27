Return-Path: <linux-gpio+bounces-27734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E78A1C11A48
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8FA43BA185
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4321329C4C;
	Mon, 27 Oct 2025 22:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mcFFAINK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05C42D94A3
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 22:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761603217; cv=none; b=gWhHfRfcIh8C6lfa1dkDd9kf1LKsVFVU2BNFh7qVyAWO5oUS4aas1Fve1zb14VDP3gTJRCCfyr7qe5Zbuf4Z1bN2uCIZV1KtMn23PRkfHtYqzx5RtIX09At2TBCjMxdD2Q139KASyKOqVf4ptvbhFMBXOcQp1i7HEDoxsdwc2FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761603217; c=relaxed/simple;
	bh=mQTKJScatLYjbszW8Nmlz+tuTFmWhnW9yYaJmefda44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mnbXrBIwd2YwWMs8Hu0ziZqG/N2hWBwCJILogEEcwXg3eQ0XT+N53SJmXkOh9D7gxgap24Hnrls3aA6c6JXn5o8amj/Jt/3suLlrzclO4merHqUoOESLn5ruHJm7SUzR2R1HbwIZcEZcKe+gYM3GO8HfUAVTRYyQoeZsIBfCt98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mcFFAINK; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59310014b8eso129330e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 15:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603214; x=1762208014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQTKJScatLYjbszW8Nmlz+tuTFmWhnW9yYaJmefda44=;
        b=mcFFAINKBKl1oFJOdmUNYBj3q0Z1Yl5W5xNtzDyJBzoffk0hginF+vLPh24NCDWDwE
         7BW7Sz5S5UAt0c3nr/huh+Npyudh+fU6MefMLr4HCsZmSggcy3zfdqUq7cy9kvBAZYXc
         +VlhYJsFznVt4mNLVehv19PGbi5dt2QiT2rhQP/+vSmY61MBGhaI41xV/+N/ZG9b/4pD
         Red9o0IXhGjODfW5KXfvdowtp6RDKPmLTHUkxdFkktAMo7+TZQOjFXFqaA4w43rB5HvE
         2cJIEN+ccBR5x6Dbxy46Dj9zwwaAif+dLSlsGdGOSM9kisYlKYnctm9/CuKD83KP0v7M
         lYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603214; x=1762208014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQTKJScatLYjbszW8Nmlz+tuTFmWhnW9yYaJmefda44=;
        b=XK8f/dqbBUToeGf07Kf3zX7uf8FhgtZXL3TnOXhFM3/mSOHlTKKFo37MDYKKjEOTN5
         0Fu566HCH7neYIgpE9xwmhaw8BjKttjGi7MFrnnqj+doJqaDnWPnncM/YeC08V3XpPC9
         w6+9Vs9T5e2U2P6/p6tg1eIoc8R+jj9xG7kGQur8QSk5a3IdUs04Au6ALfLIHc+PC2Jl
         7NGzzCJONVnctj+TEgbuPfIpvnmaUotchQ2ZGkgdzEAxwrePlNY7PuMiZ3Xqeu6WmhEY
         TvfbUEF1z+jT/IGGCSd9gHCGu0Mtrkf1E20yrRmGWWghDnGB8J0OBkBozaYKfTRSDcH4
         yvKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpmHU0B1pgp5vYs7f75g3i5lMUbs7t5WUznoP7eiyNQgFb3Kpu6M5itZFLIceDTB3WKOFAaYHvRqiy@vger.kernel.org
X-Gm-Message-State: AOJu0YyBfxm3eg4B85mDHHcL+U7S4yLGN+0ZEgAWaigNbpWEiZ9kIrej
	XnF/XB1BFJmTAAAPhCf49UNaAhWHCVnuoG3TCUGhkm05Im0PLhtT2pcnbVEWXrimAMkE5v+2oSW
	pL5uskvNJTESLkC/IR+t+LpSy3ZUABpO93/spqBwo8Q==
X-Gm-Gg: ASbGncuzqsB0ANbacbM683ToScfniP26YyMRS5bs63qi0JZwSWULuvP6Q4XbmugK7Bd
	e/95+V2UPqlVwmQKvNrGBFF1Qct3cteRn0vk74IM/yfamMG5pIlgz4HGBjh2J+IyLNTngE4pInp
	0I/nH8uZvhOJKLvU2cYYxHjiZp7ISuMajH7Oz+8cHtioS6hAs2v/dc5o/kDe9MNG6EwK9SxgFKr
	/m9zaDBL3p8YfHtHhvv+lxFCW6iJDKa23R5lIE9s4+TpO6fPv+/J6XAldut8XLH1BXcFfuYuH19
	SD4E0A==
X-Google-Smtp-Source: AGHT+IGiyuhAd/g3j8DFK8VW5m7bOjesol+1DXV+h5pePcwa0TlxwvPOrfmVLR7Li8szmQf8I82fLHqa33iH+2F8eRE=
X-Received: by 2002:a05:6512:ea1:b0:586:8a68:9c4d with SMTP id
 2adb3069b0e04-5930e9dd17cmr516262e87.52.1761603214129; Mon, 27 Oct 2025
 15:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-8-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-8-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:13:23 +0100
X-Gm-Features: AWmQ_bnPVCXY1Dpjano01hZ_Z8pqJmAtt3_jZEXugTZ4oHs4-VjsvtZbv--6EHg
Message-ID: <CACRpkda1d+WquYsUq-ntWRC0J37w6=UBcSSAwL_nroS4_h_dZw@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] pinctrl: stm32: Drop useless spinlock save and restore
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> There is no need to acquire a spinlock to only read a register for
> debugfs reporting.
> Drop such useless spinlock save and restore.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

