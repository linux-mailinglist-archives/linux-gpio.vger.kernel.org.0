Return-Path: <linux-gpio+bounces-17723-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A08A670B1
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 11:01:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76425189B984
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Mar 2025 10:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3301519B4;
	Tue, 18 Mar 2025 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlU3O19e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D493FC3
	for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 10:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742292033; cv=none; b=HTVjZgczOSMsLHNL4ba3wMrW2ajESOIa8hF7iL2zQ77nuKntlPW0gYd1T0rR7/akCXQ71OrBmQB6n029tMGBEgEQKkujodwHiJMG7ysAz1+lughyhOpFoupyFEuIedDKqw4enAkLC/dErxhhuggVyf7gRs90cWf+OdF5ewn9FwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742292033; c=relaxed/simple;
	bh=88Ew/JHV3n1wdam6CVa5TbxLiF0Xk09/EW+jwrp07XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVuP651f7gu8wjqbvjrmufcSZbrsZOxn/idUX/PvxpHB4a7s67PcYKNMTHLUCGnDE6HZzSyJIpdOuyezW+LCDLTI73IaOeyw7srwXAdDdwFlg8lPZFwm+wMaMcnNj2UArBph/ODUQNp3FKxhbSO6hWQxnXx5M0YBqGOpwbSSW+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vlU3O19e; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso54284981fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2025 03:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742292029; x=1742896829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88Ew/JHV3n1wdam6CVa5TbxLiF0Xk09/EW+jwrp07XA=;
        b=vlU3O19e0LTY0vzgfDPu4oQpEL6xYHh+OsSOdkLCpHsqbMsJsa5CDXOe8rP+gqEd+c
         ApbzXaiNtbwO2wBb2xer9fl0qw9tPFehjeMp50Dm/b66ALqqFsWUnEyIvx3WR5Tf35Zl
         bKcw+74IpYVQxd0F+WZEkDHuhxcT/SW5KxGw6YJPYj2vZOPVlknDnbo1u3SjySwlLR2u
         ubgsvqVAb3Hz1tGJXLBMT563N9bjPCjy+1va7fM7oQuQZsMOJhve+4p2MzbzZJoKU0ph
         h4k27AtlgWd3nonmLD/GoycgrUsvL8BMiicycwNN9qwN9BAn5GZ/4iruMcis8/X4O7+5
         G4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742292029; x=1742896829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88Ew/JHV3n1wdam6CVa5TbxLiF0Xk09/EW+jwrp07XA=;
        b=vVO5+qJk2FqDAnZ7nF4CrH2byPW4tnUsY1KEYzOgs2nHUGjRjQb3vo4NQApwkyVIqV
         OMTBSi5YMGN0nnC/XbVG1ImL/tst1u0bMNxFP4YUwHqDZ8gjk1c1Eq4wkN7TgRJ4tFVA
         p/HMT1Md+1dd+XSG8O+ENLo/0h2UajOfX0oSeudLEeAshz9Shmoyf3/EILr51fLtA4Cp
         rGQHYIsvxCJnjZ4mrWJc/19MGZtIJ1ipsjsT+gOZm61xKLV6DttDIf+RTO3stU6ZYbsn
         u/G41TXA9Jj/uO9FoL3QQ/UOsaCyet3zXGTt4DXiMfRwUApcBqNzJKu3asNPk9Ddz3Dy
         WwtA==
X-Forwarded-Encrypted: i=1; AJvYcCW5rgTjAsqqgb+IH52zQCnR9BZkrX3ooInvDz4KNVHqLkuYYL1EOx8puB2dIQwwjNIz3T4IFSE8R32M@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1rjxo2U5s5OOc1MYQcL/4Qups9nYSIRrthW3eaupNIUCLoHrn
	NIvH4bPibWGBMmTVmdkc0O88SJVqvY18JQryCLyrLSy4Dhiu10AZYJf0xPZG5umvxq6vNmNPXyF
	dWVGoRvrSIgM7E/mFIeOqwL3x/FjhslmV30UfJw==
X-Gm-Gg: ASbGnctj86T59U55AF7S/y1MnJEkcTXMzfXRcA5HduKSLDXn/sU5/SXqtAjzrwQgIGV
	c29P+BcRskfWsniDQK+CMtBm+tmDpmqLTaFBLjWJfVCA3B/hHoPJbgcodq1qxGilbRh/IFWYqhx
	oVWtSgM3AHjRRN3Sgbn3Y1VA0lOA==
X-Google-Smtp-Source: AGHT+IGx0d0IG5Qu5h980ceELHGnrxg89MCKrFIldzHMRMCA/lGXswPfa2gNmJpcd54DYf8zHnCPV1Lx08thTGn7Kb8=
X-Received: by 2002:a2e:3a18:0:b0:30c:465c:51de with SMTP id
 38308e7fff4ca-30cd95ce168mr17838501fa.10.1742292028879; Tue, 18 Mar 2025
 03:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PAXPR04MB8459BEB700FB66FE693EF1CF88DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459BEB700FB66FE693EF1CF88DE2@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Mar 2025 11:00:16 +0100
X-Gm-Features: AQ5f1JoQ6-C3pGZR0HE9vHn6lSPGMqn0dZzARSrrf72ztEAj-8A-Tr9txGFFJTA
Message-ID: <CACRpkdbHr_CpoqGwE+mXxV0My30ZcBRJmK9313fXN0rbPDPbDA@mail.gmail.com>
Subject: Re: GPIO TODO
To: Peng Fan <peng.fan@nxp.com>, Marc Zyngier <maz@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "brgl@bgdev.pl" <brgl@bgdev.pl>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 8:38=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> Besides the of_gpio.h, anyone working on immutable
> irq_chip?

This work was initiated by Marc Zyngier and he has since had
to resign irqchip maintenance so it lands with Tomas Gleixner that
has too much to do (I think), but rest assured that he will be
grateful if you pick it up, so just send patches.

Yours,
Linus Walleij

