Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3A65EDB70
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Sep 2022 13:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233548AbiI1LNe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Sep 2022 07:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233445AbiI1LNS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Sep 2022 07:13:18 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC98C105D5D
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 04:11:19 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d24so11499977pls.4
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=/bM2F8kr2GzsHc+T4M/LhVEiprig9xBb3+0rTqWO420=;
        b=wdXb2tbTuT7MFVhiVMlkCQFT20ltJZXcfh52n6JbTPE3kt4bPdR+Sqfud8k0y+2H+J
         ySrY2wU31hvsmpjFbpmQUtrLwRag0Qx5LQjCsNMazWP88XKgmqKIKyZSeY486l5IxkfK
         iL+3MWRyZQLFTIr2PIrWOxuLnmqgSjpgZTBY+/xXK0bIUdUdgJrXCNGOPReXgySDfh/f
         Tw2V1NWtebcKaK2qREkF89Xq3amCOAVYiCwedVsR0x5XMxMeRxC6V1X+EMR+C+31LyLq
         2D/wQYYuW8c7bs1yOe7gPRbnQTq1WiiKIOMSRGh3+QxXb7I84P5CGWmQTUcvUTDgEi0I
         llGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=/bM2F8kr2GzsHc+T4M/LhVEiprig9xBb3+0rTqWO420=;
        b=4XzlssLNW+875tTHyajzkGd1nSNDeCea1TjpPdQ18GsouB0+WSQsvuW2fpHxlXG/2j
         m6A7x/Z3NuGOyVWzvalrGqNe2TFCjTAHWNjUF+Vgi+vX0iMTVyzrLu9gw7UT/sicvdAn
         MmNEYi0PvlI7sl1ymWRPg2p2Vnkkdcr8Rf4VJTeX5i6Es7jE8N64uFmcal/kBUnZS/tE
         fkY5CoKwDTEgimwuM5B85jm82wpyRjlWMiV78g77TE5g7XPd88W3MkmcDPxpilLol33D
         BYM+5ekUjrt1TMbVzi0ItgLvPfvLuMb2dAY5nDlvHkgkRGXci4U4Tnf0k82t6ctW5aWo
         ogEw==
X-Gm-Message-State: ACrzQf13Xb899kkAKh9QoAixjTU6oqSeRbZ59RN0wmuej3AiFfaiodyf
        b87UeoWR2Snl8zeHY6j/LL0Atg==
X-Google-Smtp-Source: AMsMyM4DqCYBN4bMMPE+IS8rBecZCTS6uVRv1P+4NTd+APi9rs3SLZ8LjKRHUPUOMcyYduO1MEsqfA==
X-Received: by 2002:a17:90b:3144:b0:202:e2cd:2d2a with SMTP id ip4-20020a17090b314400b00202e2cd2d2amr9752447pjb.39.1664363447653;
        Wed, 28 Sep 2022 04:10:47 -0700 (PDT)
Received: from localhost ([122.172.85.153])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902cec400b00178a9b193cfsm3483848plg.140.2022.09.28.04.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 04:10:46 -0700 (PDT)
Date:   Wed, 28 Sep 2022 16:40:43 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V6 3/8] libgpiod: Add rust wrapper crate
Message-ID: <20220928111043.bs2ihopdxduavcsq@vireshk-i7>
References: <cover.1664189248.git.viresh.kumar@linaro.org>
 <f86049275ed165a3bf6922962b3c7e02744e5ef0.1664189248.git.viresh.kumar@linaro.org>
 <CAMRc=MfWs6Rmn3i6c_pygfJ4zG_3=LUOnnqPeVDq0u6DFWtEPA@mail.gmail.com>
 <CAKohponphOwaPOoc50fPX=3p+fHbbvP5wJqLYCXfrjeX_nLkpA@mail.gmail.com>
 <CAMRc=Md4AmweW-p0f+RfwzOH0S3zPhK-60+di8BzSp6oVHvcYA@mail.gmail.com>
 <CAKohpomwhkKL9_mhmvH1C1WmHG50M5tL-Gy25Y2gVsbBuWGdiw@mail.gmail.com>
 <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MebN1VwSzGtdGcYAeiN45D-e59oi6in-n7JYKqyqcum1Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Here is what happens at each call for easier understanding:

On 27-09-22, 17:25, Bartosz Golaszewski wrote:
> So what happens if I do this:
> 
> let buf = edge::event::Buffer::new(10)?;

buf1 = gpiod_edge_event_buffer_new()

> let request = chip.request_lines(&rconfig, &lconfig)?;

gpiod_chip_request_lines()

> let count = request.read_edge_events(&buffer)?;

gpiod_line_request_read_edge_event(buf1)

> let event = buffer.event(0);

event1 = gpiod_edge_event_buffer_get_event(buf1, 0)

> let count = request.read_edge_events(&buffer)?;

gpiod_line_request_read_edge_event(buf1)

> println!("line: {}", event.line_offset());

gpiod_edge_event_get_line_offset(event1)


We will allocate a single buffer (buf1) and the event (event1) will be a
reference onto its first event entry in the buffer. It will print offset value
from the second read_edge_events() here instead of first, as it was just a
reference to the first event. And for such a use case, the user should do

event = buffer.event(0).event_clone();

-- 
viresh
