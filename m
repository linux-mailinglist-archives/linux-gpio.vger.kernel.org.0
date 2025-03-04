Return-Path: <linux-gpio+bounces-17002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89497A4D6B2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 09:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F13FA3A872D
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200A01FBEA1;
	Tue,  4 Mar 2025 08:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lcMJYJWc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612D41FA854
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077607; cv=none; b=q6ix8i+dEPr6YzmGQGEGJJlztJ1Y4jxXJaeLRTjIA5oIVvZevqaviZl4C3iYGYl29JPB4k6KLxKxj4EA9nKNVAcqcQqe+GXV3okWY2h2uR5ZDJnmRS+8DnWKDsVOLgvvoBWTgUbJSbi+GcbW0fWF23R/KWkNAkw17G7CL73vHLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077607; c=relaxed/simple;
	bh=YK/v+HTjGEFPbEINjripCBl0YEaMvBdXG3vSD9bGu5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=POQu6yIkFk9lHPpz7WvIdLXyjLwaF9FLkfoLIao+QkKwNriVlC1T/5VdMycu9IsZ3Ck3eWQJRdr4FS7uXYu/xkvjG7BNiG8HNfMJGeRMPhukUSCabJuQkXXFNKdlOVpU7anzCkLumGizldogLAJoKWUPhk1BSl9dflNl6a0BZsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lcMJYJWc; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6fd2587d059so32695307b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 00:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077605; x=1741682405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YK/v+HTjGEFPbEINjripCBl0YEaMvBdXG3vSD9bGu5w=;
        b=lcMJYJWcyFv/O1o3KqIUHZv9hFomU32mdKnoZULCveMCmgTXFYma84DF+muqVNQ8cb
         Ye8eGspmkhIBsgvhUtb3rpGFykGmTo3RQEeOTatfe9uumuD/gupiV4IVHZ1HlbqQY/NU
         +DOzgujaNkqonuHs2g8DxQnusiMHqFSu0NkTAukXEkrrgpibNQtoCW6Ehqnw1lPLILcE
         TrTSGDQ4vNZr3Jx/QBr/fBMFBVTH//OcnUAVj1md4uN92UFT1UFe4weaMSPVDZBXZJ8X
         KRySWc8JREgxXvUqx1eRtGf1TCl2Ud/xLIj4zi8XImHlK61TgywozZC0mKkmwpHCjDAJ
         0qLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077605; x=1741682405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YK/v+HTjGEFPbEINjripCBl0YEaMvBdXG3vSD9bGu5w=;
        b=QbqdfOBU9S6leF33YfnZKofpob2eBKRNfoqLmZ8RNVR0/TNyTYnY5zfdFwsey+XAy4
         Xt/0UmGWQtn0YanSVe7lAzzYbiRWkY2sRqBVq1uLJHZB+SvLgDMVO7oMwTtdQ883JJce
         HpWuGpzkUs4dydeAwPpJND6NHpFAGkaVNn9PxCOnmy5sNVS5kO0C0R/e+YtW/dHHoNf4
         C8jZ98SET1GKQWVCe22i9qVaPRPH9NVi6ypS53nb3CqH1uSbsLRxG6yXRSMh/uwuFOPv
         Lh4r+GrqCIHrISeHnH0XCR4r136O1dTcFRziz5Sbm5GzVKZ4O0uJDZKri3/vCNuh/iub
         EO9Q==
X-Gm-Message-State: AOJu0YymHnFqAdKztHS6znzWPZ90fQIpzpFYD+mCdVWRqlBwfNKmOEVi
	RC4wqYT68vxvgugpKXBkAPgzejgYg7MmK5OFJjp5RVZSZSmD0pJnqdjDH5QAwvbxjizAnNDwhpy
	jit0iCs45ORNI0vwyK8oP2dYp5kdeshWHdIbKTw==
X-Gm-Gg: ASbGncurEExJi93vRf0QiRGVvEfPfH7osLOdXPHrphWQKnoWYhNR1tLTAgHgK77jD47
	PF6z8RmgEaAqk/dFvlRyEWA68fDd2bsGoM8ZDSbFWhlhArTA4H5QXhPSH7o0ombjcgcje4pBiKo
	33LsWkneypcG0LqKJ1tgXN5dMMFQ==
X-Google-Smtp-Source: AGHT+IHzjcSCOgliNPgzEIfJP4zRqA+GXbH1gcPHEqHVdjToORnVLP+q+n+ER/rA0dxnmWxFxju94KxpZdoxEUjQw0w=
X-Received: by 2002:a05:690c:3387:b0:6fd:4521:f9d7 with SMTP id
 00721157ae682-6fd4a1b5ad8mr221954587b3.24.1741077605393; Tue, 04 Mar 2025
 00:40:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303092826.318638-1-colin.i.king@gmail.com>
In-Reply-To: <20250303092826.318638-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 09:39:51 +0100
X-Gm-Features: AQ5f1Jq2rfvBPsQCyevIyKgnAdZxW9QavsIRuyb9v_d9Hj7plbiOg3wN5ZMKg3c
Message-ID: <CACRpkdZwjOWTJioAY92LwmEGmqZJHu3d6foKNbtVmNDN1h_cFw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: Fix spelling mistake "paramers"
 -> "parameters"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 10:29=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:

> There is a spelling mistake in a dev_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Patch applied!

Yours,
Linus Walleij

