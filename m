Return-Path: <linux-gpio+bounces-66-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB67E9DCB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 14:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C185B208B3
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 13:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D551208B9;
	Mon, 13 Nov 2023 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lt2/ewbB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F22208A8
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 13:50:30 +0000 (UTC)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A84D4E
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 05:50:27 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5a7eef0b931so51297217b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 05:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699883426; x=1700488226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XpqZBrmzhIxQHZe4Z2kGptUvFXh+Fzs3fll/Ehi74k=;
        b=Lt2/ewbByVxhjHp3mnVuNBOWvDiJe05gtia1NiTTKMawB95jOgUDxHQK5+AC10TxAK
         Mf4lL+xTqjrPl8sUuCNNXL8IbeBnaODOZFbotEr6tw4O/p7LKOj4HwfXHyhIDYe+x3V9
         ggCWonZKmpZDCR4nQRP2bMcx3tSWHmmWO9Vx37Hnxqvm3lMSiC2sou7SfQj+7ncHVl4U
         G0w8VCy0N9/51ouVp61QcjQkTU6eSXJtOhDZewecPw9d1SsAXekhIWgKrbkJOO1ISwPS
         fF/FWeSPxVDH2gMCSMYPZ7vgn/KDH34sH95NcuRpHI48rPkFC6Ui0gr8G0vC/8I8vlrn
         xffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699883426; x=1700488226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XpqZBrmzhIxQHZe4Z2kGptUvFXh+Fzs3fll/Ehi74k=;
        b=nngr+m5IcXir6RaPfPn2k9015C7jc4mCBBpxiBA2VGy3Vlq8Aprq0bcfVFxCmDZbxg
         rMd4iT4A2XF4f5eBCsePfWFKnOkrgRId9f4/HDKUbqRjrsiL8BFXMO7rRoHTR6uKlDOq
         HX4exghRlr0OA2f0PuDEjgNBlEmTFEtGiDTUuSuUIjNaTI35poBjtZGggzi8bTqpW/CV
         dI5TiPbd2J00jTc9jk2UyYI76ShKBJ9kS2HzHrptoN1czFFheZXkSyF+6CU3AQ3fumss
         YYoLQU8rUvdgZD6LOnc6uf/mTuS9HrR+VjmWTRelbOA2LAstIOaJeYaGK8iPAzZMA+J+
         qOxg==
X-Gm-Message-State: AOJu0YynmNzMmBEJTfbWOzfSd5NNqOc3kdNcd1Y3WAqwbMfG/aIuYV7r
	jCaDfk2OE/x/7mnCo7eHje/ZLNrSYDt7lDtqG6ELFL2AOdjuZI6z
X-Google-Smtp-Source: AGHT+IFarUwhs2XDViHk17NHkYuv+lnEMn0mJh0GEylRpU9AvpwYrjP2mMg8FfOr2np0Ga+Kpf67nCtk7qKvkLe4PmY=
X-Received: by 2002:a0d:ebc9:0:b0:5a8:dbb1:f73b with SMTP id
 u192-20020a0debc9000000b005a8dbb1f73bmr7536343ywe.14.1699883426199; Mon, 13
 Nov 2023 05:50:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230908055146.18347-1-Linhua.xu@unisoc.com> <20230908055146.18347-3-Linhua.xu@unisoc.com>
In-Reply-To: <20230908055146.18347-3-Linhua.xu@unisoc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Nov 2023 14:50:15 +0100
Message-ID: <CACRpkdYkAcHvvTNj1=n_ds0u=gdaa7Ln=t8dw8jJjO+hSb6HGA@mail.gmail.com>
Subject: Re: [PATCH V2 2/6] pinctrl: sprd: Fix the incorrect mask and shift definition
To: Linhua Xu <Linhua.xu@unisoc.com>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, lh xu <xulh0829@gmail.com>, 
	Zhirong Qiu <zhirong.qiu@unisoc.com>, Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 8, 2023 at 7:52=E2=80=AFAM Linhua Xu <Linhua.xu@unisoc.com> wro=
te:

> From: Linhua Xu <Linhua.Xu@unisoc.com>
>
> Pull-up and pull-down are mutually exclusive. When setting one of them,
> the bit of the other needs to be clear. Now, there are cases where pull-u=
p
> and pull-down are set at the same time in the code, thus fix them.
>
> Signed-off-by: Linhua Xu <Linhua.Xu@unisoc.com>

I'm uncertain what to do with this patch because it fixes something
while there are unaddressed review comments, I think we need
some more discussion here?

Yours,
Linus Walleij

