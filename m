Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6053F729159
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 09:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbjFIHjT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 03:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238968AbjFIHjC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 03:39:02 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2181430ED
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 00:38:51 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-43b2fb0afa6so519996137.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 00:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686296330; x=1688888330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wB8WjDXTk2h7c/l1vYkUseN4Mt6sYXToAOj6YlRUkeo=;
        b=MFQdUCI37XQUP5nwZijzg3/ldogw/iDxBgmdrZpqeUXaqHCPZkUFNI1zm9GOApoFxe
         6/kOsm3FGrNUTDP9n97LY6kkDRbhgKpT/Y+zt9zt0u7gG9vIiwk6VWM47XkchO20qti0
         g/HIx4BAB+t2rgtrCx//z/gsc78srBuZkowFBSd2Jcy2ygiWb7TxLtnNcUEVuDZa3PaI
         FUPh4KWhLe24Ln5NdXIjNewv2Tr0Me1H/ZiQuzhOZdCAHRVpP/ipv0+IEX7DBX6xrMEr
         QKfG7gmpSTJ80YRknBOdE0Ddq5w4PFQJuCePzbuoAC3C+NgRP2vLljLofsox1RintkwS
         5RHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686296330; x=1688888330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wB8WjDXTk2h7c/l1vYkUseN4Mt6sYXToAOj6YlRUkeo=;
        b=iy3lUgixGR9d2IeF24QUU4SFyqRpuKAAWEBP+BXaNCSc4/8wcoTfMbXYa1OmIQdFVg
         xu7ix9cWfnKJZWSbmyKVaePYoKbHbp9mq1sOqRn3a/AWYrOnSxqS5MPHPMpcumP//51B
         OnzShuB6WpTYI9jAEFbDkDZFRVG7/S+gYNdSfNdQ74yDlzfp8Nqyf07YzvpvpGmK6ki8
         oW/8AWygCqY527e5Yhd0NOvtgSQvrl05HivmTi4eV0mtqGtus88L/WohRGMhRVQq1q3x
         jAcNtZCXnb1vyXTXMC1PO8O9RaAGcJi+/+2eMRviK2oBxsLSIumio+wxyHU7IguivjVD
         JRNA==
X-Gm-Message-State: AC+VfDzDWld6jIRfC3v9sC/w6tE+h4uFcnPHgp4n/1fDiZBB5A0mHt+R
        Cmnpwc8eox1YLd84Q3vKEWD6MuOZUrbtEivWuMR9tA==
X-Google-Smtp-Source: ACHHUZ7KdtdBkn2RWPy4qsUG1+8jHnRgLjXMPYzF9RgRMW2DxTq9RaS3wc0OkRy3pYo1waq0CbkxP/fdzWg+N5Q50qo=
X-Received: by 2002:a05:6102:7b8:b0:43d:2223:f5fd with SMTP id
 x24-20020a05610207b800b0043d2223f5fdmr409908vsg.32.1686296330267; Fri, 09 Jun
 2023 00:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230609040737.25666-1-warthog618@gmail.com>
In-Reply-To: <20230609040737.25666-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 9 Jun 2023 09:38:39 +0200
Message-ID: <CAMRc=MdQyJu0EjzSpy3GWRNLHNnjwBc43+n398JLKqmxgfUW9Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] core: doc: fix line_config documentation generation
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

On Fri, Jun 9, 2023 at 6:07=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> The line configuration is missing from the generated documentation as the
> comment for the defgroup is a normal comment, not a doc comment.
>
> Add the asterisk to make the section a doc comment.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> I took the liberty of patching and updating the rtd documentation, so it
> is already fixed there.
>
> It would be nice if the generated documentation would provide links from
> the "struct gpiod_line_config" to the corresponding page.  But not sure
> how to do that, or if it is even possible.
>
> Cheers,
> Kent.
>
>  include/gpiod.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/gpiod.h b/include/gpiod.h
> index d1833de..5d4b6af 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -715,7 +715,7 @@ int gpiod_line_settings_set_output_value(struct gpiod=
_line_settings *settings,
>  enum gpiod_line_value
>  gpiod_line_settings_get_output_value(struct gpiod_line_settings *setting=
s);
>
> -/*
> +/**
>   * @}
>   *
>   * @defgroup line_config Line configuration objects
> --
> 2.40.1
>

Applied, thanks!

Bart
