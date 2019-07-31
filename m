Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1E27C68B
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 17:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbfGaP3U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 11:29:20 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:37509 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727813AbfGaP3U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 11:29:20 -0400
Received: from [192.168.1.110] ([95.117.90.94]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M5gAG-1hzz9A2h6A-007FEO; Wed, 31 Jul 2019 17:29:18 +0200
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: RFC: phase out static using gpio numbers in platform drivers
Organization: metux IT consult
Message-ID: <40af948c-3407-2100-777c-3bfb30f22708@metux.net>
Date:   Wed, 31 Jul 2019 17:29:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:v4Wlby4rz9oTskEIAtRyd/kheOPqYOdOlkIZ5DA/JgaMU2bz6xQ
 pfI8Wl1evQJP7vTB88OMkKAy0T8P+VRAv+aygeXnYaeOAHFTAxGXjyAAqPJGfjoE2/6VAg3
 /gjiEN3oOG758Bwi97AGS17VoJ+Im7A9myOmrb5Bc8midB0vALD9ikN6yO7N02hcHaYcZ0c
 0TpU10ivS4je0+W0n6EhA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u2inyiIyJiI=:T2eoryU69631mVBFryr1Vl
 gv4gTP8kMwp21lLipMx51RtcT8A5a36oDDA0/m4a+oVocEeWlJwx8IIa8LZMg185boAxQGw3C
 MruwRuVumaCm8mqm63I4E9RPhBJtW65yMpM91EADkmg/uJH2/1RNgsVD7/MFRFaDizoOvUiUR
 j7KZhAxwf+h079kDnJW+bKaGXG5AprGqZC1DFN/821FbDrjrJNXoZnIeCT27zguK9Z2XNoMpU
 fJ5ESZKdqlqTsTHsEIimj8FtmAxv/4g5/iyM/DlzCQ6PUPQHBDxyovFueaXs+Vf2hkDo+RRlI
 cJMs/n/jlQQIdVtjKNO0QuuSkx0800waAs6Mxo8TmRrDc3Zjbrd2qp0/daJ9ZYmwWcVTJLpvn
 9FMICu7Ff7MGc1xs3tXHejWyFByAgSiGYA/hFOt0YXQODNhLf6O5RY5m8nwtdZaHW0vOHdW97
 ef/PiQtkBNZui0A6ScKgN3xosvwJub47Z/h7QCR/013rujm3h/lR6DH2PUg6+xhlH3D1dgBwH
 16Bse4I4ZhHcyVqvWsxtR9SrV506UkBSEYsfGQwpm8MNBVodqY4usM4cZ2MKZcG8dc7A1KhL3
 V9y1qoiEgPAvkv3AxHi/8XD+ukT3DwpZHvL+8Sah/J6v2YBqZevF2zjlImemH4cE8f4JX8AIs
 /n0/rSQvHnZRgLGQaa+Kc3SraiIz2j+RIbZykNLGX++1UxVadGwbBrudAqRbfdN9qEz3SvpU+
 El/osFm4clp++X5Ej5II0cwg6pq7PaDqyELdRfnVNl/27uQIrBnaUV96qKE=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello folks,


I've seen a lot of drivers (eg. many arch specific board init code)
are still using raw gpio numbers, which AFAIK are deprecated.

Shall we start phasing them out and rewrite the corresponding drivers
to use match tables ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
