Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28F3B734D7D
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 10:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbjFSIXM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 04:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjFSIXL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 04:23:11 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76677196
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:23:09 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-392116ae103so2169871b6e.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687162989; x=1689754989;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rJ/7Kbo9gs7zs3QTF5nFKkJrBjocKGAtdax9LA/wsFg=;
        b=NLf6vD/d4D6D+lJPXzleg9rbn2gKSMoq11CpAwhYkVIks3leekaXGsKXSdUAm4yZ1C
         +4YF4j6TuM18yPbH9DNO/VR5i2ViUuQiSi+YkFSky4Q25QePCkbRnJh99uhVGwMwv+8D
         GV9a1riDUUpNw0T0yAFuFDCuAu1/Hz9gD3U092Z1A3KLI+gYBs3KWHeuOFKmCk1s6O1R
         Ll6p3AQWfan4weJOR8lP1xiPKCM/eW53tKENszJdhypPVMv/eaUIzy/GKGWuaPNs7hd6
         P28/JvevALvVKLvH4tBTtIx2dMTLpT3QFNNOh9+IA2d5q+MhVmgOh9NcGIUFKBYu+P3M
         xUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687162989; x=1689754989;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rJ/7Kbo9gs7zs3QTF5nFKkJrBjocKGAtdax9LA/wsFg=;
        b=HihW0/xBZ2qot2W8heEJK1ZUkoH9LupVUFAXTZxMNmhaJKl91S5LEgG3NJtaeAM1Fj
         skutfNTaRrcvs2P7421aSv1kT5sKqJg5rvUXXkriufH20bVfadAgEKuxk/6xq+L+/CXX
         icofy7mPUGXggp1nBgh6Eg/lp8osC4FflAhk/BvbxWEV8Y4+b4BsNBiy2bg3UmmOdUDL
         8vYQBhjthtLJApQ0rsCC8OANYO61SPUkpfKVmqUlJS53PLxVNd7XxYltz6I5YQEQ1Quw
         dN14EdIUML1afzLWs3N3F8ozmLanxzVoujlqT9qJZaKKVu7ZTV7MneX74CgN9iK5kFzl
         YT7w==
X-Gm-Message-State: AC+VfDxwPCwanFTvxnknzztb/NFTCvV5eJc6Ln81QiANwgoGyk7Y1FUc
        Sg70WbnUJF0mf1aORRhQF6SwP85a9JU4gHCjlD8=
X-Google-Smtp-Source: ACHHUZ7xXWI1tUNtP/JB2dF1+YgJ9pCGhDZ2nbjCMGY6bBUrWZGi7lemw+OtzL1PNiza9ybvjNZEOwjbA7YROhNuljY=
X-Received: by 2002:a05:6808:179f:b0:39e:df4f:e68f with SMTP id
 bg31-20020a056808179f00b0039edf4fe68fmr1411558oib.6.1687162988421; Mon, 19
 Jun 2023 01:23:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:7a03:b0:11f:4412:fc6f with HTTP; Mon, 19 Jun 2023
 01:23:07 -0700 (PDT)
From:   loan offer <skyexpressccourier@gmail.com>
Date:   Sun, 18 Jun 2023 20:23:07 -1200
Message-ID: <CAPmwR52j7zm-Awe-ot5fGOpMsqBUBT3=-J55ZhyWw_ET0GurJw@mail.gmail.com>
Subject: Greetings From Saudi Arabia
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.6 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear Sir,

Need funding for your project or your business ? We are looking for
foreign direct investment partners in any of the sectors stated below and we are
willing to provide financing for up to US$ ten Billion to corporate
bodies, companies, industries and entrepreneurs with profitable
business ideas and investment projects that can generate the required
ROI, so you can draw from this opportunity. We are currently providing
funds in any of the sectors stated below. Energy & Power,
construction, Agriculture, Acquisitions, Healthcare or Hospital, Real
Estate, Oil & Gas, IT, technology, transport, mining,marine
transportation and manufacturing, Education, hotels, etc. We are
willing to finance your projects. We have developed a new funding
method that does not take longer to receive funding from our
customers. If you are seriously pursuing Foreign Direct Investment or
Joint Venture for your projects in any of the sectors above or are you
seeking a Loan to expand your Business or seeking funds to finance
your business or project ? We are willing to fund your business and we
would like you to provide us with your comprehensive business plan for
our team of investment experts to review. Kindly contact me with below
email: yousefahmedalgosaibi@consultant.com

Regards
Mr. Yousef Ahmed
