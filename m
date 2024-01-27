Return-Path: <linux-gpio+bounces-2664-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7771D83F252
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jan 2024 00:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9E4B1C20D0C
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jan 2024 23:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDAF22F1E;
	Sat, 27 Jan 2024 23:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qmb+iyM7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8486F23757
	for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 23:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706399592; cv=none; b=lk6XKpnrcSaUvKJOTtThlY2xMh2FQvwvHvWBhw6c/giCM8OdYCYb6cxOD/QfmV2hePNd3DKNxrd8qMJX/edvOc2JRYL9sW14Guffh7hSOCEuH+CyJc1/Z0e6sOLRys9EtibjX1g+6BYRF+FC7D7icMl/mxwGDxl35VIEurEV2Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706399592; c=relaxed/simple;
	bh=y29bBOr0W8GWvuErd7/PqliVtdGt3XvPDU1lv0OLRhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObENH+E0/bHbifbK+oH3x0n9EKdH3/WI2w356DRIllKv9oQQ6dZfVbLUHQis9UV+crTSvkeueYzUDqTxsbiHJ/28kONW7sJ4jACpkGmjNvNX5cMiD5RV2wYGMQ/etjRoqcdnmr3SkEWe2wE5DS5/XcJYg/hlUQz0bFGdc6zuPMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qmb+iyM7; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5ff7ec8772dso19844937b3.0
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jan 2024 15:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706399589; x=1707004389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y29bBOr0W8GWvuErd7/PqliVtdGt3XvPDU1lv0OLRhw=;
        b=Qmb+iyM7okGb+fAqxVZWBuOSY6MxLeusIa7/+JSZ4mUBQbHQA1sI2XP4QcFeeX9g6W
         oA5K5WMV0wnq2T2e3ISg6gj/Ra5PGejJPBls4YoJlWSHgaJBN2N+0iaBjdCJlzKsEqyR
         DRS3oDtj4gpm9EohxZdAYc9CN+YqrBxcqcdqpH/4uIfBb3wKuo75i9uZQRPRqa8t7rXR
         Nb8EuQrluOiTdRWJUJ2urI91G0FpXUZGc//4rUGg6Wsc4bKCSyxH/89SWrJmAn0Y5/P1
         WVNSzrx8GZOjnUqPBNRQn06cEqlESWjvWBDJhuxNJLg81plp9PblJbvSrXjsxMRlkBg2
         WpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706399589; x=1707004389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y29bBOr0W8GWvuErd7/PqliVtdGt3XvPDU1lv0OLRhw=;
        b=FchhMCpJYmXXzGaEeYl3ZPoBoX6iwJmsSromQRyaiXeLun5+rn1QnE7WDvoNKslFrA
         eBgLkyCC8gXFtAKudGb6/Mqc3BurqgQ/0DxIjo0hHkd69c0GU9ZKun403QDCgnFDpHd4
         CqXVHPUtOqL8VLrqlzXbCSKjinJz+X3qXuckCs4VDirZVaiaOBRE4O3Wnqz7En0vBQJq
         1xLO77dzLoEO5IN1DWmh+jPWEetc10wAvuIx4xrjWeUzOpzFXWfTGjBxPqRHg1EMT2Kw
         nrUS4ZjmQA0bJmt/4xRxgXDE1WnnAVUX14RbISZTs7nWJG4efkCSY3DxiELX15LhD58k
         /hjQ==
X-Gm-Message-State: AOJu0YxllOfNCkpnhu4LjqVozzHLWbjMijmSS+BTdsdsKBhhLx8SaHvE
	QZ6Ct6OPVwyIToSr3fPrGVmU3Tiz7jX3UrPhtuf9PFtnyqrPh7teSPOxlbJFi/v51/YtHV2ujhW
	jpBDwdVnXH3gWUeMmMstndI7YdTTQBe5ytANXLQ==
X-Google-Smtp-Source: AGHT+IEhBRR1+Lt+t5PwX5bLtetfxOwsLRlWvg5X+Vn3cAbutbVfqPerwvTLBdzuw4fwNlv3dgffGIvAL7Z3lkau6gE=
X-Received: by 2002:a81:b187:0:b0:5ff:4b02:73b9 with SMTP id
 p129-20020a81b187000000b005ff4b0273b9mr2196680ywh.21.1706399589451; Sat, 27
 Jan 2024 15:53:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117124234.3137050-1-jean.thomas@wifirst.fr>
In-Reply-To: <20240117124234.3137050-1-jean.thomas@wifirst.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 00:52:58 +0100
Message-ID: <CACRpkdYFwS=KCmR5UDhz_G_DQ4B21f3JjJLTLCfr+D0Yn1iA=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: mt7981: add additional uart group
To: Jean Thomas <jean.thomas@wifirst.fr>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 1:43=E2=80=AFPM Jean Thomas <jean.thomas@wifirst.fr=
> wrote:

> Add uart1_3 (pins 26, 27) group to the pinctrl driver for the
> MediaTek MT7981 SoC.
>
> Signed-off-by: Jean Thomas <jean.thomas@wifirst.fr>

Patch applied.

Yours,
Linus Walleij

