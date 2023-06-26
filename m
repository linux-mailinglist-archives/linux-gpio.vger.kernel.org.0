Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52AED73DC09
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jun 2023 12:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjFZKKN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jun 2023 06:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjFZKKL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2023 06:10:11 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F8711C
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 03:10:10 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-78f32e233a0so783593241.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 03:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687774209; x=1690366209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bf0DJ9ecwrc7XFZ8btUSgwjjrXd3X5J48H7MQpriJnA=;
        b=lGTudxIoo6W3i4UeeLvYSDeX5L96GQfVXuDWiZPqgTczHVFcaIJM3OcWwMAGJ9nxXi
         2OEeHe7DDbs/1zFN/UzH4BO9w11iGyXCEaj1g/7HApzMSONXjTOfgc2bWflt0dSU2Tix
         0844q1zQW5PNlFYOtSYEvoqjNfDaEhZCYWaS6z2HQRXkWjH4erc77X9w6ZFVjJL/L5aH
         iGrw1X5jY6CvncniFrVBiirCqnq2nE9ILOsoZXT6Hkdn4MrCHEQnDehfGA+w+Hc/Umm9
         xPIPlzrgdUvCsXy0yMNzCnh4J7ZsCBU4dno+g1Lr+HWNidrlmdFEthd00lQBPZwfpCNl
         Hzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687774209; x=1690366209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bf0DJ9ecwrc7XFZ8btUSgwjjrXd3X5J48H7MQpriJnA=;
        b=BtNxsZnkswPdQhGQKLFv2qqteU9QNpwLQryHebHJvo2mYxanzYbzqy2QvwleQ2ycm7
         /vdODEccFNHrWAzsCIKyyognHYS61rurh3iHRsLlqer91XurZV3HG+IKaSAucVlNI7bx
         WEyu+HEaIvxpkph8bxgOeXOnSJs5LkTYrr0Fekp5Ops33Ofv5NtQLApMLlaJpcv1YoHZ
         CCsdSx3yi2iNQFVEBBhqdWGYcEeD0p4Hbl4DQ6n8hZuKEWoFYnqSJh7pllsPyrH2jhzB
         zpAHihKB/lpe1d/vrOfS/tYLuInJqW5GZSmfiCRODFjXyK4Pc3+kqeTWJBIrLK43kqOW
         c2aw==
X-Gm-Message-State: AC+VfDztzui/uf4j3ytspanY998yxUidL1JlWaUFGEGRWRgytS16WIv2
        StEhPAmN+SZjtGuuLzjsN53NE6U0U3tYIxmFg2bMyg==
X-Google-Smtp-Source: ACHHUZ5LdsBA/M7febmvAANPUKUUtfNlRVVHVLKP3H9U2A21t0YDEMeh4MDkN45ft3XVbSCFBPeQaAg11XhgscsWq1Y=
X-Received: by 2002:a05:6102:354e:b0:440:cce5:129 with SMTP id
 e14-20020a056102354e00b00440cce50129mr7891833vss.8.1687774209451; Mon, 26 Jun
 2023 03:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230626083402.27173-1-warthog618@gmail.com>
In-Reply-To: <20230626083402.27173-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 26 Jun 2023 12:09:58 +0200
Message-ID: <CAMRc=McgNuZ0LDpj3ZTT+OWu9FQbE0vn_6oK83KwuydvjDhXGw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3] bindings: python: examples: replace tools
 examples with use case examples
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 26, 2023 at 10:34=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> Replace tool examples with use case examples drawn from the tools.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>

Now applied, thanks!

Bart
