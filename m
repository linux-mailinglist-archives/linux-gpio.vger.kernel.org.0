Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88F1E72CBB3
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 18:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbjFLQkr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 12:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjFLQkq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 12:40:46 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABA8B9
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 09:40:45 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-65311774e52so3475213b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686588044; x=1689180044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=492DE6RoJGrA86ixqGUCAuQYCsCk4G80kMjWFKSTDP4=;
        b=biLxQrCsVEjBwL7a7Hopryv7OTQg0oL3xrd0t7l1J6bBk20KT7n8p63H8ejFdKHqQ3
         iRdPq74Xk5Oa1TGOfc/6qM2mYtLK9T5+4CToG9DufCnnp5E5QuA/biJ/NlsimHakrL4U
         9vxVY8OG4fFy1ABuv9GzC/WUMa4HwEZ4Z1/ZcFTlhmxD5gEPr7Ow8RviSUI6YxjFwXRJ
         PzrukAcLmy6AStDnjC7wOOZ1+jZCtiWfZsbzVjsKDG3B+SyDkncf/+mxlCqpqfhPnqcB
         jkATNgVxkH4MoXITbqUGKTFenccUPCCZzI3IVtXcMki9bjshtnh6oTZpJrt0yYFr3znz
         m2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686588044; x=1689180044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=492DE6RoJGrA86ixqGUCAuQYCsCk4G80kMjWFKSTDP4=;
        b=idIDOKSpS7n+ahZtMbSB6TP3P0V7n42IpaDcKoB0vjSkluYscMk0lSChr+aN+mWklB
         xNk+nIRUfOszX65LO1Rq5yKwcwsegdLxDgVc9N+bJTZBkSc+rZgkOqu4K5vr2CXaBlkl
         +5C8KsEx3IYnO5PWCtsj3SmZxOpEpno2XoyTVLB44Jz/+xNP2+xOqW9jJ3bO50JvIe4x
         KrpaoD78VPBBeg2VMcWekBNDiKu4laY6l04uEjsvLmjw09OFaJm5YYD5zOrdG1/ct4DP
         hzoVc6j75K3fK7mQR+T5EDEVUglBJsAlM/C6VWe/wnxo/3tRPlfKBtUZTiiqqzWgo5Kh
         klFg==
X-Gm-Message-State: AC+VfDzaJObz6GvPtn3hjTRm7g3FcyM1hGIzKSe9bYunZRnQ75UfCbVd
        fQLllSvhrAUV5iEILzTr4qYMmsIA8BQ=
X-Google-Smtp-Source: ACHHUZ5IBNIcQLbie5/n6sAbWFmke+RQOHmg7xPdlUGq1oHuiBwof2Db+bvCbQLPRGPoLj0uvmxv5A==
X-Received: by 2002:a05:6a21:7895:b0:10f:c81d:f18a with SMTP id bf21-20020a056a21789500b0010fc81df18amr12237474pzc.49.1686588044525;
        Mon, 12 Jun 2023 09:40:44 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id v21-20020a631515000000b00543c6d7dbd7sm7768930pgl.24.2023.06.12.09.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 09:40:44 -0700 (PDT)
Date:   Tue, 13 Jun 2023 00:40:39 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] doc: add configuration to generate doxygen
 documentation on readthedocs.
Message-ID: <ZIdKh3kAEZVrOYIL@sol>
References: <20230610020148.8973-1-warthog618@gmail.com>
 <CAMRc=Mct7uByAbiHxQJRQTXnGEkty28keX1wjhR+aHgpOa1EQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mct7uByAbiHxQJRQTXnGEkty28keX1wjhR+aHgpOa1EQA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 12, 2023 at 06:27:42PM +0200, Bartosz Golaszewski wrote:
> On Sat, Jun 10, 2023 at 4:01 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > +# Copyright (C) 2022 Bartosz Golaszewski <bartekgola@gmail.com>
> 
> I would stick with regular SPDX-FileCopyrightText line that we use
> everywhere else and - while I understand that I maintain the project -
> this file is authored by you so it's only right to have your copyright
> here.
> 

Yeah, this is an old patch prior to that change and I haven't updated
it - just sent it as is since that is what has been used to generate the
rtd to date, and you mentioned you wanted to look into updating the
docs.


> This works well with sphinx-build, thank you for doing that. I'm
> actually looking into using the breathe[1] and exhale[2] extensions
> for sphinx for translating doxygen into nice sphinx docs. This is a
> good fundament to build upon.
> 

That was the idea.  I thought I had posted it back during v2
development, but apparently not.

So you want the copyright headers updated?

Cheers,
Kent.

