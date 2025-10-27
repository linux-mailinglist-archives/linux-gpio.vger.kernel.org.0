Return-Path: <linux-gpio+bounces-27733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E80B4C11A21
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 95B55352209
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EA7328B73;
	Mon, 27 Oct 2025 22:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OcOFMDw5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0DC2F99BE
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 22:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761603174; cv=none; b=X4ebNhKq2hzt/phEagcDylD5vEx5aIpOREyQDMkJifUx36rD/zZLqdZZpvY0/t3k0f+Qsp6nxlFVl8mZE0QKRxkFXVSY0Gb0Gnst+x4AwenTuDgaPRpMevRtkQAf7T8qfpkw85Gv8LcXI97/okgS6zSXtSqo/bFqBZQv5rKzGRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761603174; c=relaxed/simple;
	bh=p0VYuTzD+pw6O+ffSIwOFLJ+utPOn6Ed1+UK3H7oZ0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fs6nmeTFBoKaB19WKnu592/frrerVQwpzIHydkmQBMuLnDFfBJ9VtbOaoOl3Xm6Xq3jPR8/8ylXQ0t6pUl4mBar2C5B2dC4g5TeDSdHgn66Ga2gF0DNAQC8Aa91eDcdE+fdKxi6PsaI9YgGznm9dp+NOAng3CzNRlt52FaZMdjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OcOFMDw5; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-378ddb31efaso62034451fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 15:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603171; x=1762207971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0VYuTzD+pw6O+ffSIwOFLJ+utPOn6Ed1+UK3H7oZ0A=;
        b=OcOFMDw5WE1VvjjLIvOIMrhOr8poXBK1twid9BTAVaxS0GykGPg3DDgQiZKPovawj2
         3ler2GJ3PHtwNzxKNYmraXmuEQWGq7eMqgfg2tNpl4/oYIrX/QdVllqsFEUptunEx4uL
         bpYPn343NQjsZqSNBIGQVNYLDsjVeFHlk7hPXVi3ceK2H0OFSIUZqf/FvR96jXYQUfGC
         zpp+M7u2+ThyBMTdlW0uSMEnDVXNpdEiNL9m76SZ4jihOACza8ojFuyyUshb4QZUShu5
         4zKYfYG2VPxmWQNS7Q+/Ca1BCL0XmiSK889PtjuTzyEu2okOYu/ln+0AgB4a2kGT81n/
         gBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603171; x=1762207971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0VYuTzD+pw6O+ffSIwOFLJ+utPOn6Ed1+UK3H7oZ0A=;
        b=Nwf1dKzCImhNVWZn813igBWjQl98IWrUBdbwDg7lFYcdvzAxwneFAFwS5K9jo8IsP1
         w76Ot24Nvyr4wAAHRfK/y3eP3Dq0k3Q3Ktcw1U5kQJp7SxtZjouDXdP894c4sGpXA4V5
         HP1OxNuQlnSCAO5NCA6zk9YHMljVPk+PFcn5T4oToYnIiYx6E1giyzegH/r4UHVZcmPx
         W5AuQpwcwXhbGQIEkY/jvxwIKEF8d0YyW2UMexJCcI4jhWLWvTsZ8HHZ6qq2yK4ov3AJ
         fYJ2UNRSQeame8CMrX7skFr7tHgkf8ZQLa32silnizzkYoG4zRQDehXTSI70LoA642R/
         Mk9w==
X-Forwarded-Encrypted: i=1; AJvYcCXrRQW/LPIwUz8BIwwpjEf1QPjKay4prCPJ7ffqBUOod6SoefHDhIQOgiO4tWeZrMK/9etHh7wtN6/z@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxsyj0GXktpveYosBP8sBl/qObyS6NK5jycpSqZrq+AhgTJNOF
	rKnlbBt6R/poWqcwpN6sPZkbHHjr4zc2JLfRNHQJUtWQQhj+k3fUHK49tNlmScuqt0Z0+0m1uk8
	QXcT0fIWWRs+48ROZIjEJAPC0ee9+UIN/ln/ewhx7ig==
X-Gm-Gg: ASbGncu2Bp9xVrnCxmBdprEDx2M4+enX/25+Oz81fH05aUse9GF4ULaNqvQm2I62AHS
	1ONT09jBO7bOMrJbvJRbve5wIObV2R0Zz0oEhIhJh37b4yb6AnnlHICzdYEgpneZ1HXEDPbhpbA
	X2+OVCEHSp9g/Fv5SOfCFV6cnfC/Vqfej+qS1oe6pZrJr8TDO2aM2CgEaEadPjzC+yl3GMXT68D
	nLYrZKLxtaX+0iDujHdWrNMH4JVPf1Lmcx4OMfrZVM/g6KLtNVooVpOzN8W
X-Google-Smtp-Source: AGHT+IEO4OBX6LOPY6n+Kwj2RHxhOjz2+JIoc8GL2mJCp5ePHLtyDD4AZKAQpVBpjKroBtS/M17W9y9jzhmN3enwix8=
X-Received: by 2002:a05:651c:4406:20b0:378:e437:904f with SMTP id
 38308e7fff4ca-3790774c7cdmr3152661fa.40.1761603171396; Mon, 27 Oct 2025
 15:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-7-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-7-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:12:40 +0100
X-Gm-Features: AWmQ_bmFZYqcGNF8COoxdkJmlFz45N7cHtmhxRN-kPjjoyKz6dQA3AfG9pT2B40
Message-ID: <CACRpkdaSvKiGaOMbp5cmH=cCCzmi=cbUf+=4GvMZ-e-NbJT=+w@mail.gmail.com>
Subject: Re: [PATCH v4 06/12] pinctrl: stm32: Simplify handling of backup pin status
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

> Use C bit-field to keep the backup of the pin status, instead of
> explicitly handling the bit-field through shift and mask of a u32
> container.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

