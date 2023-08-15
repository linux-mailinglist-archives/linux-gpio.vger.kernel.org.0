Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4818877D175
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 20:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237958AbjHOSEZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 14:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237772AbjHOSEI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 14:04:08 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2FBF1984
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 11:04:07 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99c1c66876aso753796166b.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 11:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692122646; x=1692727446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHQetwDY0S+nesWckihQyYGyUne1hsQmp/ypqZuBn08=;
        b=gIZBAdDCRGoR0cQudPL6l4mFJpS0F+2Qg0Lz5lkHd/DKHfQ8cxtRSvSchoDCN1Qmza
         HcsRHW+5FgfqTvXFFW3ojKHlJqvcX9pmx20QVXaNF1ExVTdrF/PhRAKyYdBIbN2/yll5
         ThQud9GKQAXB6h+aysbMsbUFQqbxpR2u5a8ORp0CfnQMdzJUYcjV5iIRLos8GY6vU7UY
         4djPr0+ivTxpsR7CDwkG4arfmXHHfscF9JC4cw4QBcqlqtwTMHADkSbqaqZPKUxFu1me
         1rUFQMP8wt2j6ObE479qLT43r/Laq0HTGpqTmojrabpvQkzu5QDgHaBO5pwwlsNc50vE
         zCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692122646; x=1692727446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHQetwDY0S+nesWckihQyYGyUne1hsQmp/ypqZuBn08=;
        b=MShvSrZLVPuYpBmd+4ffv2Ds01vLYCrzopPU5WESqCHZB6Ftf/u5pNgycNzm7WkgX4
         W8NiFjtmVyIN60gVTjmLyxGXQY0PtFesBLHeXY0IGtPYZIP+v7zRlJF8vllBH00m2d1S
         qVNvvfSTE3oE9awleQ7O3zKi61u5H/qQ26EYrEZHcb0WygHxdLQN8j9NEJB04r82jZw9
         9/Tu732W+qlDeoav6WTZyE0GPGXi8OSfx4Hcrlsl5IVHshr6UAlZpvJfAGA59F4W4Dvt
         qQuSiDtSS7Jsi5ezsVlDMexw3RzxR1WeiiTxnsNWDlZH+SZ4DRXHkejbO7RFEU4yrTCx
         gf6w==
X-Gm-Message-State: AOJu0Yyn5Tsji4aPMYNZ0zjV0qs+3h7f5zE66tQQJGFmqNGm5KNdVQKn
        CSAK0p6ypdB78FWAJ9tWiGZHQ6wt0GuGUxKUMyslE65W
X-Google-Smtp-Source: AGHT+IFwK3KEd1qqN9UMlTRwX+as/eLCLveAOkNUX+6/6UPELj5ZyRqGhEKeOTNGGxs0M81YNohU1vRcT++C+/JXN0A=
X-Received: by 2002:a17:906:3cb2:b0:99b:cf0c:2cb1 with SMTP id
 b18-20020a1709063cb200b0099bcf0c2cb1mr11042695ejh.66.1692122645688; Tue, 15
 Aug 2023 11:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <ZM7xEbr0essN2qY3@sol> <CAN1+YZXd_dMJK9CYL+bmtTRCzT=W7Kt9VTeD38Wg8habFLirzg@mail.gmail.com>
 <ZM9oB0l4fvOinzLm@sol> <CAN1+YZVD7ui4HSRMaGv+y-xT9NgeGNWDM_vx2MhZfiGrwhLPVA@mail.gmail.com>
 <ZNQzT2MtskTTZTiI@sol> <CAN1+YZWz10vZ__3gThzTACbiPY=EVVJ_2qjrAzk6rgpjWwKv9g@mail.gmail.com>
 <ZNWH+L9o5gp6PWyq@sol> <CAN1+YZWTJ-TqjR99MBGSPPmQY1ao-TCGu-DfNTYBQvbXcmV=5A@mail.gmail.com>
 <ZNWQsabr8kPCbD4X@sol> <CAN1+YZUtCp1FLUSTGJthpXt1q7=2seYFiEHTb3-pMarpk0DnOA@mail.gmail.com>
 <ZNrLmd3DxcFPptEq@sol>
In-Reply-To: <ZNrLmd3DxcFPptEq@sol>
From:   andy pugh <bodgesoc@gmail.com>
Date:   Tue, 15 Aug 2023 19:03:29 +0100
Message-ID: <CAN1+YZVAMVji862kGmbstOo-Ldu1tCjqgqYPOc2D7EhPa6uyHQ@mail.gmail.com>
Subject: Re: How to use gpiod_line_set_flags
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 15 Aug 2023 at 01:49, Kent Gibson <warthog618@gmail.com> wrote:

> gpiod_line_set_flags() was a relatively recent addition to libgpiod, so
> my guess is you have an old gpiod.h being included by your build.
> Though that was added in 1.5, so it would have to be older than that.

Ah, yes, that will be it. I forgot that I went back to Raspbian/Buster
and that has v1.2


--
atp
"A motorcycle is a bicycle with a pandemonium attachment and is
designed for the especial use of mechanical geniuses, daredevils and
lunatics."
=E2=80=94 George Fitch, Atlanta Constitution Newspaper, 1912
