Return-Path: <linux-gpio+bounces-4089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4736286FC03
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 09:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76CDA1C21BC8
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Mar 2024 08:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4FB18EB9;
	Mon,  4 Mar 2024 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="unNdXOce"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA9514A8C
	for <linux-gpio@vger.kernel.org>; Mon,  4 Mar 2024 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709541520; cv=none; b=E2LFlY6w6iLE6upc4HR3Vaani54iyuyCbdRG/Egpd1zk5a01Vl36jTVMXxVDDBlhvrCvUFA+EeYAlh06FkZtUewcu7u7RY21GlH12b+DZdyrkQRaTzuQL5Hm6QqoJoPlKsHdTmQMEdYlO9twc589/Qavhripw0Vda8one3OjwMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709541520; c=relaxed/simple;
	bh=8PxjXuB69XGowlvOlnYkVhYafVwvuNXCLxC1BGKnSSM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TvziNDm63mAB6pAd/pWFQtNVMPTC1FwcHqtDUE41JWYGJ4EGsquDOmEjEVxcLBPhFULreR7idqSWSi3yAWl+ycnhyXwwQeuQNf/OykPcTCdpwtx0jK6Otmm7kqymhddUL1J62Ahnu1SyftMTr+F4rLyToekTryYLf7gE4LcaNNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=unNdXOce; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so3910488276.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Mar 2024 00:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709541518; x=1710146318; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8PxjXuB69XGowlvOlnYkVhYafVwvuNXCLxC1BGKnSSM=;
        b=unNdXOcepPfs8YNKnpmlxmZYc860BuOIKmqnICdzO/++NlwEyBHDFhUqXwcBW6MvcA
         zxjCxgyzcae/c4ysV0dRtlvD7WgnZHKju3QApy5fBPA417qSezfCx5rioMeKO/UqlrPN
         KsmHu5ZX48DiAB+fjUtLO9A07qLZOyf1OBVmb1CjwN7AAUrq3hIGf9UetrWGboIEbxxL
         VA3MLvU9e1xagEkgrfZLmMh87QnaVmsVRBgHqyBQdIJd5U3i0l3AUyuQY3X7whFgVE2j
         v2lG8P0RVAyJEI5lFV0tNMmfAFtUcdNCn89yFjO6IFYEN2mtVoyq3QbIrEwkwx2SdtT5
         w0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709541518; x=1710146318;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PxjXuB69XGowlvOlnYkVhYafVwvuNXCLxC1BGKnSSM=;
        b=XOOqV4nZiC888vyvVoglX0FKtDMkybEwU71CdsAD3YNjJ6JvPGP2AFyFTf38FNDSMj
         s1k6mel9KJFPGi0XOLl2Wgy2q4fF0kcKbQWYgW4vpCPIDSQdwdz85yGg7zlCBomMJjMz
         4B7wg1OmXHAihNInb6ajjehvVdtQ+nvBOXmmpehxC88iEFiwx3y4erg7Aq3bbaSPtKt8
         iXghGzBUB8jihNSQE+Am/zEWSpJchO4RRYwF+J/VTnnU6JKM193SJWB6BFRkTvLTVJ/+
         iCnWizNvpQeqOE6m0/A2t2id9QfMnr+u3zFDAj+C3m8JF+sak8iPwqTlxXyxo/tx+8vN
         cY/Q==
X-Gm-Message-State: AOJu0YxwSRiM99s6WDAtH/V7gGe/GvQpoWGXMu3yKzhlW03gQ287YASk
	McEyJlmf31W4UmGuSrY3Bz2xXftZzZlHmh+hI8aulbb5FsRgSNDs0fhCMWK/0L1FBwMhARD8Pf1
	QTzeX4LjhC2VQ9loC4yyNpBly5HCmIn3KZbgjZXOP8kGktA8mrok=
X-Google-Smtp-Source: AGHT+IEam7DtS9RzlqaMQVEkVRs6JwxpNeZ5C80QhyvQOTIDVBm71CB25hoAScVgEcx0G9jA3DW59xY/i79mHRac42c=
X-Received: by 2002:a25:b988:0:b0:dcd:26a8:7f84 with SMTP id
 r8-20020a25b988000000b00dcd26a87f84mr5217892ybg.47.1709541518151; Mon, 04 Mar
 2024 00:38:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Mar 2024 09:38:27 +0100
Message-ID: <CACRpkdbCniO7imk3+EfhAqR11Wj9NFnR08d2+Hf_oXks5QKzqw@mail.gmail.com>
Subject: Immutable branch for nomadik-gpio rework
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

I prepared an immutable branch with Theo's rework of the Nomadik
GPIO driver, including some icing on top from Andy making it a solid
rework and cleanup series.

You can pull it from here if you want it:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-nomadik-gpio

(If you also want a signed tag tell me...)

I have merged it into my for-next branch for linux-next rotation.

Yours,
Linus Walleij

