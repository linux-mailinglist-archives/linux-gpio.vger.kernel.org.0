Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAA5A734D4D
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 10:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbjFSIN6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 04:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjFSIN5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 04:13:57 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0113D3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:13:54 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-988a2715b8cso141353766b.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687162433; x=1689754433;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htfrwTPssG2qyZTdsJjMl4v6HmKHmtTds20NAsA3i6Q=;
        b=omV1WxhN4LJAsfE/DAx4J+YrdMnipQPnD2Z0BjjYepPSXjNx9FJDDjZwxCUKnXqRZt
         ZsUFIkjUAFl+XKU434X4XlR8PNZUGcQOZBNxLYnwV2L84gmUUNcs7iR/puqS/tQE32g2
         hkha89qFSbG+mcWGsKvu5eUcwzGM3Rn2XpUMV8dRZUpslA8ZvNuXVg+W60wNO3+nbJtd
         PbN1aKRv7h/Qwo/IOvmdDdZA4ySHdtvNJHps4UYAqRH6fJSgQbglV6SrBh62HSbf+krC
         WKAVggMORlwsPmZF13ETh/jLtOw+KHpVBPa7gAd55fpdtUKf9ofBNhgtNxZ6tR/vkTby
         F/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687162433; x=1689754433;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=htfrwTPssG2qyZTdsJjMl4v6HmKHmtTds20NAsA3i6Q=;
        b=CUpr9YycoGpAuG9TrG9GAwhR3xDJa4gK8fqrufcgiSMc5CaaRj0F7cYHsGJjfdjVSJ
         LZGMx3y+4aHYk2L56dh1lO1NVZkOlvoUrwbaqbMkAVqjuY24VVj5G7k8H+yh2T4OiRTL
         KaP+4QApqWJSpnf4JdNyOFGpiU+Wxh9cdoqlzMCU2mU7ghPhS6ToOcRBLFhFgiRBYKpM
         mDlGU69CqQGToFucQLSG8tLQEu88Gce1B3BpeMpodD3PBwLA3fU9MNrGE4Z/zjP9kaVT
         6daNH20RgucD3LyAJvyOrIsaa9z3EeWgxT028cMkR1XwSttIYzET0DmxEAM5E3JOMunE
         CExQ==
X-Gm-Message-State: AC+VfDxi257UneqOORyPBNevnqSpm6rETMg+JLJLvNkFYINDZGj4Yab8
        MawsQ0GWL3uuyfK+b8V8Fuk8NQ==
X-Google-Smtp-Source: ACHHUZ6LHSCj/icM4N/9wbNClRiPNyLX3mC+CywpxtaNCvGhdDsy4ZN+hW7nO/LSfStKyNctLuyO+A==
X-Received: by 2002:a17:906:6a27:b0:982:c64c:6941 with SMTP id qw39-20020a1709066a2700b00982c64c6941mr8887631ejc.25.1687162433085;
        Mon, 19 Jun 2023 01:13:53 -0700 (PDT)
Received: from localhost (i5C740111.versanet.de. [92.116.1.17])
        by smtp.gmail.com with ESMTPSA id gz17-20020a170906f2d100b00988936b142bsm1486670ejb.147.2023.06.19.01.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 01:13:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 19 Jun 2023 10:13:52 +0200
Message-Id: <CTGH61DGZBIQ.RVXF4UG9BYH2@fedora>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: rust: fix clippy lint warnings
Cc:     <linux-gpio@vger.kernel.org>, <brgl@bgdev.pl>,
        <viresh.kumar@linaro.org>
To:     "Kent Gibson" <warthog618@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230612154055.56556-1-warthog618@gmail.com>
 <CTC81IMWHW2L.28NQLXAIFP60L@fedora> <ZIl6X8YAUHS/n5s8@sol>
 <CTGGDNWWBD6E.FLAMJGXFKF3S@fedora> <ZJAKTdRVEwZfnKb+@sol>
In-Reply-To: <ZJAKTdRVEwZfnKb+@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon Jun 19, 2023 at 9:57 AM CEST, Kent Gibson wrote:
> On Mon, Jun 19, 2023 at 09:36:48AM +0200, Erik Schilling wrote:
> > Sorry, got distracted while sorting out the MSRV mess that I sent a
> > separate patch for [4].
> >=20
> > I do not think that this is the reason why we need the casts...
> > bindgen generates bindings using std::os::raw::c_uint [5] which is
> > stable since 1.1.0 (and was previously defined as u32 [6]). I think we
> > can just drop the casts entirely? I can run cargo clippy --fix on lates=
t
> > stable (1.70.0), then go back to 1.60 and everything is still building.
> > I am having trouble to execute the tests in that version due to some
> > linkage errors, but that should not be the fault of the casts.
> >=20
> > Did I got this correct or am I misunderstanding your reasoning?
> >=20
>
> My reasoning was simply that building the bindings as you suggested
> resulted in lint warnings, which is noisy and iritating when trying to
> lint my own code.

I fully agree that we should fix them! I was just confused about the
explanation.

> But I'm just the messenger.  Your question would be better directed at
> Viresh - it is his code so he should be able to tell you why the casts
> are there.
> IIRC we needed the casts historically, though I don't recall the rust
> version we were using at the time.
> If we've moved beyond that then I have no problem with the casts being
> removedi, in fact in my initial comment I lamented the fact they were
> necessary.

ACK. Not sure how the situation was when the patches came together, but
today I would suggest to just drop the casts. Do you want to respin your
series or shall I send the fixes?

> > Note: One needs to fix a bug that cargo clippy --fix introduces since
> > it replaces nth(0) with next() in event_buffers.rs and introduces a
> > unconditional recursion.
> >=20
>
> Who is using --fix??

I do all the time (and spend the time I saved typing on reviewing)!
(Thought mostly I use the suggested actions suggested by the LSP in
the editor instead of the CLI tools)

> I did put an allow in there for that one, with a comment about the
> recursion, though I'm not sure the comment is sufficiently clear without
> the warning in front of you - and you no longer get that with the allow
> in place.

Ah. Did not notice that... My brain was only thinking about the casts.

- Erik
