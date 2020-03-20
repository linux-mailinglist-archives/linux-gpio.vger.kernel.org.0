Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC2618D5B1
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2020 18:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgCTRYp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Mar 2020 13:24:45 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:46197 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgCTRYp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2020 13:24:45 -0400
Received: by mail-il1-f194.google.com with SMTP id e8so6267115ilc.13
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2020 10:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TvAquG54ZzkfK6ikLeMOnUIahQ4eso/lssjgMNYjQ3E=;
        b=ceqaSu49aXchEYQeu30bOV4TfTU498Mxb+IX4X3RA59H0OZPqY6xmth32kMk3yOUXB
         v/9kz5sM0n1V8lSMDCCNSUVpVLGn7YtVylwocJxN3O1JvFCLtNlQ5WnG9GLxE8tQF3a2
         +qqhwiPrFcb2eTZRiayUw0p4Xs20ff/afBMpBs9CYjDhreRQy/CE9HzXdAp8irbVXnWv
         FvE0GrRi3amspGyC/Oq9bhjGrdqmoTvjfGfE4ZFD6+sk/NfD9Xfdd6HeE1YR0Z+8beB7
         kvbU+YHl3Ipmw0lJLHwEJe50NDiufhxKRejTNFME75+Mk3KERihDL+6rhvKV7LEZQ5xh
         cdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TvAquG54ZzkfK6ikLeMOnUIahQ4eso/lssjgMNYjQ3E=;
        b=LlTi7kvfdEQUV7YabcpgyhVCBNaW8mxGqmqIfHLkU+nzq61cXWpMZmunJdHK6IeJcL
         NyH+2DJXxXTiuamzYVLGMGeeBpZ9hxyc93lqViMC71ng+y7+lwDDYFSvoDTppzwMNYg1
         uLRnF+mlu3VxnCbRJzc7jbH1DPTMOs5T9erbYvKYxy38D3wZPA3M0usoOficO9fF91WA
         Rcwi+fAZrRL23Ykexqz17iRe3nuNCrK38OCONm6sABW83J2kGSkFv8XWjr6sqCpYyOj+
         FikgE3hSqMsvIUCP2xRK9OdMFUXxSvfRla6AtKYYKb67Qaz3H3entZvagz/dAhSkCQHs
         3KUg==
X-Gm-Message-State: ANhLgQ0QCOES8B9A+W3Ee2Q1ivy1aTOCgpYUxquoQ684mbsRjVKzSEuM
        ZWWBzq8v2NCTZ2KfWG25/BrVQwu7x4xv3OazWnm46A==
X-Google-Smtp-Source: ADFU+vvIxTJDlGNdawi/FgpXD5Qa3KCtSOpwjfr9gFDWezA3OYnHUTKUhvBuGAL3WS080sMfNYU18b3qIzNQSsB36TU=
X-Received: by 2002:a05:6e02:10d3:: with SMTP id s19mr9110247ilj.220.1584725084112;
 Fri, 20 Mar 2020 10:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200319205553.GA9893@kbp1-lhp-F54859>
In-Reply-To: <20200319205553.GA9893@kbp1-lhp-F54859>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 20 Mar 2020 18:24:33 +0100
Message-ID: <CAMRc=Mek7WLZvEv32QWmRSdOU_sEehOJ1JknTJ3J4ObnHNub3g@mail.gmail.com>
Subject: Re: [PATCH] Fix typo in gpio-utils
To:     Mykyta Poturai <mykyta.poturai@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 19 mar 2020 o 21:56 Mykyta Poturai <mykyta.poturai@gmail.com> napisa=
=C5=82(a):
>
> Signed-off-by: Mykyta Poturai <mykyta.poturai@gmail.com>

Hi Mykyta,

please read through the files in Documentation/process/* - they
describe the way patches should be submitted. You need to use
scripts/checkpatch.pl on your patch - it would tell you you need to
add some commit description even for trivial changes. You should also
use scripts/get_maintainer.pl to get the list of addresses to CC on
your submission.

Best regards,
Bartosz Golaszewski
