Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21A9A79C824
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 09:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjILH0Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 03:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjILH0X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 03:26:23 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C786B9
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 00:26:19 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d77ad095e5cso4934920276.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 00:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694503579; x=1695108379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLdsOWkCbaUO2wihDuVV34jtr6h0+7J+jydeFj+9d3A=;
        b=FHxf6FGLo/aAe0RKd3LC72Dqv5r/hojKYGnCpjKTy8FU06ma+pcWsnK8ZD9exQa54W
         XKdbmTvom03wLo2p/fi0kzXH1cMx3dKnPrfXg7YEHKXKXzpVMnLwa5XZOqoJspYKpbGn
         5vX9wNS4bCyhPQkhZbY7BcqBXS0kuh+qIi33t59+cuTCyDRHRcqJ9EgrEAXu+7Ap3Pbh
         FlfanFlakLzBjIh04k+T4vgdcplz7Q39OjjKyUNaFOLbceM0J034d+omgHsqK8hXJmsX
         vWjnJ/SaPAJHdNdQ4waDnBLZdmA/VyAhOWxJ9V1Y5WpKytay5JzJkkumJcEpCP4aCiJU
         AhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694503579; x=1695108379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLdsOWkCbaUO2wihDuVV34jtr6h0+7J+jydeFj+9d3A=;
        b=pANEneNl41ysHzfmybOVEh/gSxHHE4mLYzTgJgiNaXz8FR2ZrprLXgEtpOYOam9bH1
         na+f30b1/XfCeHaNYsDaKlmOph6bl6rlisB8oBSBzYZjbo/dfvyFvDPNgiWVfSZhJ710
         CDzJFxFkFZNZol74L6Sof4AZJ0Od1Abfd+59M+c1CALBeqjLiakNvsJhJBt+jOeGqKNm
         AvWPsp6JU5L/OJ5FolFUZqraLxGtOmL+1TtyHMm6kd/Eha6l7daAOCi7JSWjPtVukHXA
         fmxHcZ3ZW8fucEUElHVyms6ukoVmojE2GHyny7QmTApMbqGZ0aIahZAQXXJFVoc1gQyz
         YKPQ==
X-Gm-Message-State: AOJu0YzppzituvO32GCyaRyuI6vu9AcygE0zvYAhKE1dA3kbJa6KU1Lw
        ycKqMd5RWCnLLBo94JNQUzLej9ahMmVLMY6schrVkQ==
X-Google-Smtp-Source: AGHT+IGeNWnbTJYHAEpu7ttxsHAQMqTYNLyDgS4Z0qnT0Qv02dPr86nF3zYh83i2sXkcAXGeeyTdc1GC/t+sQyizd3k=
X-Received: by 2002:a25:4c2:0:b0:d13:5ab9:827e with SMTP id
 185-20020a2504c2000000b00d135ab9827emr11105762ybe.16.1694503578805; Tue, 12
 Sep 2023 00:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230809-topic-mpm_mappings-v2-0-4c2b4495e654@linaro.org>
In-Reply-To: <20230809-topic-mpm_mappings-v2-0-4c2b4495e654@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Sep 2023 09:26:07 +0200
Message-ID: <CACRpkdZw=EfPUWqU3-o3aPQSYZWn5hnenbMqgU73Y8oTo3Ogtw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] MPM pin mappings
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 31, 2023 at 11:21=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linar=
o.org> wrote:

> This series adds the MPM wakeirq mappings for some SoCs and fixes my
> "big oops" within the 8998 driver.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

I simply applied this v2 version since there has been over a week and
no comments. Any remaining issues can certainly be fixed in-tree.

Yours,
Linus Walleij
