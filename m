Return-Path: <linux-gpio+bounces-134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAC77EBFE5
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 10:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECAE0B20B23
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 09:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066AF947F;
	Wed, 15 Nov 2023 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RrLiRV+F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450E9FBEC
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 09:59:12 +0000 (UTC)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C009E1A3
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 01:59:10 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d9cbba16084so6565998276.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 01:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700042350; x=1700647150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMYbJ2pYyOF1bQRIseaOIgNKpTkxL2DUlV+Adcdxow0=;
        b=RrLiRV+F5TKUSeWyyD7BgqiwEFAcdNAMot6tUi/wm3wOKKCKwfGMUhPMWaupE0GsEt
         W2TxZgIrnh5k0frUnB+6eeWdjQ2He1h6RfE52T9eMJ7mtInxw0YQh49M3/OaKUshio0k
         2r1GKhIsuH3SWEo90k4hauylgWU24iWkYF5YIYjB1ps7C8/2j/9YxvigGj5rszOoqza2
         olbx6Y23QAVEbwWF7ejTot7wwrUZYWUQq67l+dIUOBGOfPXbXxQjATAAYLXz2Xko6w97
         ma519hHrtQjGjQhbAWd6KUHFtb9IINh0ocVWnMRvKdan6TvNAaenVN7WYIJ2Yw89ESUJ
         rh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700042350; x=1700647150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMYbJ2pYyOF1bQRIseaOIgNKpTkxL2DUlV+Adcdxow0=;
        b=St3VP4Dhnh3blpAfQUkZoitvHawNCey12qeH2iC5gJuIB1xuzYAhn82UhRMDrZHOCk
         1xMj0FD79Dun87095+kr6Tlsl6LnnIUUpZjyfGVHo+TLs+Lx7oZ/zr44vV4tLWFkj2UL
         W6vrujNee/qK/R6s4060ND1X3FBREkl9FwTFXE+YzCIg3PnyXF7DS9MUAldypMnWLvkP
         xQacc4ZnoRiiLD2Ms6gh5hi/faG0DunZ9Sy4oNTrHG/oJTHoNSB1I5RVtg7xcgONRWfD
         bXJg8gFEx3wjWffbzg09zaoD5WBF5MPe5yVBVLB7qHXUGmIl+stUyOUM9Q0O/F9UWgGr
         GgrA==
X-Gm-Message-State: AOJu0YwrmntKqT9C0YGDtHxUwXxR8qaNQQ9WcOk3q9QekjowWycMfY90
	MLzuObqJMSmVrL2x4zLdIMiL/K/s1lgZ8cdiVMCeAg==
X-Google-Smtp-Source: AGHT+IFIi2V7s4Jk14pZAM7pqhWmLZYA7ebEMthP/5WmyIYDlMdlE/vDv+mOO97GJHHKq2nsoZVf3yhHI/ZXUDn1P7M=
X-Received: by 2002:a25:3d81:0:b0:da3:b814:2500 with SMTP id
 k123-20020a253d81000000b00da3b8142500mr11637353yba.18.1700042349793; Wed, 15
 Nov 2023 01:59:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115010906.35357-1-quic_aiquny@quicinc.com>
In-Reply-To: <20231115010906.35357-1-quic_aiquny@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Nov 2023 10:58:58 +0100
Message-ID: <CACRpkdbmw=goFFiSYOC4_ybiHiiBJJqmVv2Gh=v5nuTnQ1Z1Gg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: avoid reload of p state in list iteration
To: Maria Yu <quic_aiquny@quicinc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maria,

On Wed, Nov 15, 2023 at 2:13=E2=80=AFAM Maria Yu <quic_aiquny@quicinc.com> =
wrote:

> When in the list_for_each_entry iteration, reload of p->state->settings
> with a local setting from old_state will makes the list iteration in a
> infinite loop.
> The typical issue happened, it will frequently have printk message like:
>   "not freeing pin xx (xxx) as part of deactivating group xxx - it is
> already used for some other setting".
> This is a compiler-dependent problem, one instance was got using Clang
> version 10.0 plus arm64 architecture.
>
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> Cc: stable@vger.kernel.org

Thanks, very much to the point.

Can you please send a v3 and add the info Andy requested too,
and I will apply it!

Yours,
Linus Walleij

