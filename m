Return-Path: <linux-gpio+bounces-99-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D66017EB0C4
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 14:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91C022811CD
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Nov 2023 13:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE413FE56;
	Tue, 14 Nov 2023 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TKK5+0hB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7D3FE46
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 13:21:54 +0000 (UTC)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3B21AA
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:21:53 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d9beb865a40so5748522276.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 05:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699968112; x=1700572912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BeJ22vqMxUogoMw/G3OvqPi0ZGBXIP/Uhk54+KkFXs=;
        b=TKK5+0hBcgjtgvC9WweXjd9ZpN6mzgcqylASHW5yBUnKOQgk0GbOHRD/l70y/XcEmH
         liSG5saSsnYIp/hqH/gK96QsR1N5/xFQ+yCa2/yLNENdc5cBIU0Ap9/nH6aCy/vzxkBd
         Y8CrOVkURhsLhDPze2898zBPE7JqLYExP+KUTMW3iNddetipiOE1t4dwgRX6StEdztdq
         rAM+bRGJF1aDZWvvGPAri6IgAHXeVGwkEmEmKqCgR2QliSKwC88SvQzyLV1E/uRVOfJE
         OKQZKlrjwN3WUpRyjL2ci/tr692m6B8K4zNAhHz1GPUmWXZP+TctrrqlM3ipWm1/QgBp
         i+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699968112; x=1700572912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BeJ22vqMxUogoMw/G3OvqPi0ZGBXIP/Uhk54+KkFXs=;
        b=O+HlDF5kUWcyDGbNWU4vValdn0arrJHf62lVN9Eew1tBp4VItHN63allf+sFZdGldg
         LkkN9PejMwc9lK6CBOQZauFFgXUlWlwJK64FsDmQwWQ/s+6MlVG4n+m3mUu28i1h78DD
         udzVauVPAL5kXIypkDSZCfae1pqJWgudLMAxmmJtnTtbmMhK8BNGRC5zCvQmmBmCvex1
         P9BdobDPyBsqPStHiCdopoPmVq4gfnABL8VyY2MJt0Q+cMsl46iuvo1qBbqa2HKnV5ol
         /CwmFZyBQIt7CgUAeAkVXb7SIJdGzxXP6W87LvnEJfbShX9aUIRDfEdoQIb7qAqNRaMy
         X9vg==
X-Gm-Message-State: AOJu0YzYjxMxABBFPGAkAViEKRzD6XJH1NQ5JrUNNQzjfnkwwFh/Ghnf
	ZKIcdoglwUnIpQUF52ztZnc75++SLlDElXyLNp0MLqE6ugEC/Dqs
X-Google-Smtp-Source: AGHT+IEC+FO5ylFXSYKgv3HSp4wJLdFuKkqOYkdrsHBgrdaa8AXrmqj63uQCDeIPHCFOfaSdTOggDS/bkVYrK6nehh0=
X-Received: by 2002:a25:ac21:0:b0:d84:da24:96de with SMTP id
 w33-20020a25ac21000000b00d84da2496demr9377607ybi.33.1699968112256; Tue, 14
 Nov 2023 05:21:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114085258.2378-1-quic_aiquny@quicinc.com>
In-Reply-To: <20231114085258.2378-1-quic_aiquny@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Nov 2023 14:21:41 +0100
Message-ID: <CACRpkdYgyASV6ttW=AeAWSh3oiFDk9_Q1WV00=7yTxtuhpdXEg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: avoid reload of p state in interation
To: Maria Yu <quic_aiquny@quicinc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maria,

thanks for your patch!

On Tue, Nov 14, 2023 at 9:54=E2=80=AFAM Maria Yu <quic_aiquny@quicinc.com> =
wrote:

> When in the list_for_each_entry interation, reload of p->state->settings
> with a local setting from old_state will makes the list interation in a
> infite loop.
>
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>

This makes sense in a way, since this is a compiler-dependent problem,
can you state in the commit message which compiler and architecture
you see this on?

If it is a regression, should this also be queued for stable? (I guess so?)

Yours,
Linus Walleij

