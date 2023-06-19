Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E205734CC2
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 09:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjFSH5K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 03:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjFSH5I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 03:57:08 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C619CFA
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 00:57:06 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b5422163f4so17989505ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 00:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687161426; x=1689753426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gKvPaaqReGZjpNGXxyngW89F4TvqXzO1cE52IkWiE48=;
        b=aPwLvmdZDG2lrVWD3pop9BpJ5O27pqginRS591dKDm5G6NRC4rUFBJaCYWtjNeZnAf
         1m/3yrMIooqZ1zf5q+5Xo+QVCQV6FcC9O1zPdcJ/G+iNUjS8d8lwlrcVmX3Gh6oJCb9p
         zRw1/aQksOav08L2tD6jAiUeTIUFNyBiHLBv6iesFYkKUpjaU6dOM4fyO/cWIc9RH2MG
         Ysf9SBvCl2s4QiWQHAw2P/qmXWcysvef5UGTff521xcSxLjXmlK5BxV8TYrG6WcpDUjM
         DKIPcDTo1dxwqBXdNv/GwovKOxoBAGkG9OV5LRwWH9dEEtcRdsHDydsX1kz+FAldhxvg
         iaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687161426; x=1689753426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKvPaaqReGZjpNGXxyngW89F4TvqXzO1cE52IkWiE48=;
        b=NknO32UQgPKyDb/wYkOCczBSTKDxiPkSROZin3ojkssY1tznvzIUuiuZMD8jznMCiW
         suyUCB3ij1lFdPRahDtuNDsOna6rE4frPxFqKaF2qshvzR5KLIaFxby3MM6uHlOC8CqG
         2qJbwVryXFXfGOR6Zy0iyw4q/GjzjyCYt4DHlWaK0RXVdf57S4AmrNTOMmBPcjNKgXxU
         32tRE0FMwH8ZiPrsV96Ao56U+YnJTW8RsXBmxmIrHEOgkXqjgAwjogTOpE+nXrsyZxxK
         /bYyqiIB08xPS1g4XXJkBncASlp/Rt8mBIMAlcH8Q9E0D8DxFk3aiM2EXXveSWSblvl5
         vALw==
X-Gm-Message-State: AC+VfDxLEO8ieH/U+mLhPcb+PsfAoOOGIn15f3JnR+qbd+fbtWsLKC4k
        Q2PIvxVGwnYnQDuJrTwqmuqCaNM6Ecs=
X-Google-Smtp-Source: ACHHUZ4DWS2PhRXF6A/JpzFFoLqo0W0qakElnIPl/T+Y3FA/mDRjB9+97BNrDkbj+xG6j3fwtsJoWg==
X-Received: by 2002:a17:902:8697:b0:1b4:f649:1151 with SMTP id g23-20020a170902869700b001b4f6491151mr7720640plo.2.1687161426047;
        Mon, 19 Jun 2023 00:57:06 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id g8-20020a1709029f8800b001b54dcd84e2sm3207201plq.240.2023.06.19.00.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 00:57:05 -0700 (PDT)
Date:   Mon, 19 Jun 2023 15:57:01 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl, viresh.kumar@linaro.org
Subject: Re: [libgpiod][PATCH] bindings: rust: fix clippy lint warnings
Message-ID: <ZJAKTdRVEwZfnKb+@sol>
References: <20230612154055.56556-1-warthog618@gmail.com>
 <CTC81IMWHW2L.28NQLXAIFP60L@fedora>
 <ZIl6X8YAUHS/n5s8@sol>
 <CTGGDNWWBD6E.FLAMJGXFKF3S@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CTGGDNWWBD6E.FLAMJGXFKF3S@fedora>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 19, 2023 at 09:36:48AM +0200, Erik Schilling wrote:
> Sorry, got distracted while sorting out the MSRV mess that I sent a
> separate patch for [4].
> 
> I do not think that this is the reason why we need the casts...
> bindgen generates bindings using std::os::raw::c_uint [5] which is
> stable since 1.1.0 (and was previously defined as u32 [6]). I think we
> can just drop the casts entirely? I can run cargo clippy --fix on latest
> stable (1.70.0), then go back to 1.60 and everything is still building.
> I am having trouble to execute the tests in that version due to some
> linkage errors, but that should not be the fault of the casts.
> 
> Did I got this correct or am I misunderstanding your reasoning?
> 

My reasoning was simply that building the bindings as you suggested
resulted in lint warnings, which is noisy and iritating when trying to
lint my own code.  And I assumed that changing the code or limiting the
rust version was not an option.

But I'm just the messenger.  Your question would be better directed at
Viresh - it is his code so he should be able to tell you why the casts
are there.
IIRC we needed the casts historically, though I don't recall the rust
version we were using at the time.
If we've moved beyond that then I have no problem with the casts being
removedi, in fact in my initial comment I lamented the fact they were
necessary.

> Note: One needs to fix a bug that cargo clippy --fix introduces since
> it replaces nth(0) with next() in event_buffers.rs and introduces a
> unconditional recursion.
> 

Who is using --fix??

I did put an allow in there for that one, with a comment about the
recursion, though I'm not sure the comment is sufficiently clear without
the warning in front of you - and you no longer get that with the allow
in place.

Cheers,
Kent.
