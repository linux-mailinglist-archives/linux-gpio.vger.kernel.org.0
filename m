Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8884B513282
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Apr 2022 13:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345572AbiD1Lff (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Apr 2022 07:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345573AbiD1Lfe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Apr 2022 07:35:34 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A4B94B1FC
        for <linux-gpio@vger.kernel.org>; Thu, 28 Apr 2022 04:32:19 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id z18so5730485iob.5
        for <linux-gpio@vger.kernel.org>; Thu, 28 Apr 2022 04:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=UXiI1Ou+hgS6xUOBleoXBZ0P1W6h3cfa19FRe+lKcNc=;
        b=qdRXWsH4VboVZqMp+U+9xgTkruA8gP1PnMemdrmmg0YO6COokK/UN2OFrTer0rQTAT
         L/Gk1tYZKKFPFqo7JdutorIHaZilUNgMXSNSOCNevKkAHmcBVMElQGq6HpkYC/lBhR+z
         cGdhDa6PfwxJvXH1rpfTD2kgzo8ZHUp1se8gwJDs9ievPavEXtbkGq5W5APCsSBEjbhG
         b6RpLTbmn4cGsMi3ZP7Vc/UnPeVn3UhTzAwx9cOph6YMcAfGfSlA3NE/eQL+O/fC+ky6
         WCEFGtzo/pZQofGZq0COcl2SR3VgReM6aVbjBeulJfsOg1nbD9JO0lCeZ9TTXm3ROS5F
         lBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=UXiI1Ou+hgS6xUOBleoXBZ0P1W6h3cfa19FRe+lKcNc=;
        b=IKoPJClTVTtOY9DTngBDtzXHXLWm/7eVZ0BbnQISOcPhFmbp53hhOooOZAVlsjY/oC
         mthgTcaUWWudsrstc4qfdbZU223veJPDmUr3fKJXothAxi4vnQ/pq27qvXBTfJ8YAmIp
         ySCurM1t63kaIzBK3DRwePvECAwP6WZHYQAKtzqClHXPzORRTSHx2MswhQOOZOWR+V1G
         xyH0oU2kvIVmHdHmus+n8LZO5dkNDaMUYxKo3ZV76DhFM0DO6lGw8O5+kRS09hDAPQCE
         fRtvtNWHxkcBFfFYqEkxQtsrdOtYzdaGk9N0yfAtHYoxnLDGPD+VH+3bfrlJs0cgPvbE
         ERvw==
X-Gm-Message-State: AOAM5318emCgqMqRB6NdvT6WZjpuC9nN9lz/97bRPrmAgkkKhcbARjE5
        qxXBnX/hyI3RBlWtzMapuIDgC5n3osxyt4QV2EI=
X-Google-Smtp-Source: ABdhPJy//UOmnScX3U+9HAMHSaslp0Zg2kKG2rsRF1VyHdz+6Vg1gTuTmghrLA5VXddaXujrR+D0UZta7z+mQH+DG2g=
X-Received: by 2002:a6b:680c:0:b0:657:aecd:c666 with SMTP id
 d12-20020a6b680c000000b00657aecdc666mr4431049ioc.218.1651145538572; Thu, 28
 Apr 2022 04:32:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6e02:20e7:0:0:0:0 with HTTP; Thu, 28 Apr 2022 04:32:18
 -0700 (PDT)
Reply-To: barristerbenwaidhoferb@gmail.com
From:   "Barrister. Ben Waidhofer" <gogalonasiru@gmail.com>
Date:   Thu, 28 Apr 2022 04:32:18 -0700
Message-ID: <CAPs4PmpVKkFuMtUTtqYzDMEM1tkHd6mExwR5ngFD_ZF_qd_qtg@mail.gmail.com>
Subject: Investment Offer
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.4 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d42 listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.9246]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gogalonasiru[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Good day,

I am Barrister. Ben Waidhofer from the stated law firm in London. I act
for Mr. Andrew Walker, a former loyalist and a personal Friend to the
President of Russia Vladimir Putin presently in London; he flew into
the UK months ago before the invasion of Ukraine by Russian government.
The sum of $3.5b was deposited in a Private bank in Switzerland for
the procurement of MIC war equipment from North Korea to fight the
war, but he has decided to back out of the initial plan to divert part
of the fund for investment in a viable venture.

There is a need for a matured and trusted individual or corporate
organization to receive part of the fund. All the needed documentation
will be perfected here in London.

You are at liberty to respond for more detail.

Thanks.
Regards,
Barrister. Ben Waidhofer
